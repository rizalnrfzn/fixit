import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:fixit/core/core.dart';
import 'package:fixit/features/features.dart';
import 'package:fixit/utils/utils.dart';

abstract class RepairOrderRemoteDatasource {
  Stream<List<RepairOrderModel>> streamRepairOrders(String uid);

  Future<Either<Failure, RepairOrderModel>> postOrder(PostOrderParams params);

  Future<Either<Failure, RepairOrderModel>> acceptRepair(RepairOrder params);

  Future<Either<Failure, RepairOrderModel>> rejectRepair(RepairOrder params);

  Future<Either<Failure, RepairOrderModel>> paymentOrder(RepairOrder params);

  Future<Either<Failure, RepairOrderModel>> review(PostReviewParams params);

  Future<Either<Failure, RepairOrderModel>> cancelOrder(RepairOrder params);
}

class RepairOrderRemoteDatasourceImpl implements RepairOrderRemoteDatasource {
  final firebase = FirebaseFirestore.instance;
  final _collRef = FirebaseFirestore.instance.collection('order').withConverter(
        fromFirestore: RepairOrderModel.fromFirestore,
        toFirestore: RepairOrderModel.toFirestore,
      );

  final _technicianCollRef =
      FirebaseFirestore.instance.collection('technician').withConverter(
            fromFirestore: TechnicianModel.fromFirestore,
            toFirestore: TechnicianModel.toFirestore,
          );

  final _storage = FirebaseStorage.instance.ref('order');
  final _auth = FirebaseAuth.instance;

  @override
  Stream<List<RepairOrderModel>> streamRepairOrders(String uid) async* {
    try {
      yield* _collRef
          .where('clientUid', isEqualTo: _auth.currentUser!.uid)
          .orderBy('dateTime', descending: true)
          .snapshots()
          .map(
            (event) => event.docs
                .map(
                  (e) => e.data(),
                )
                .toList(),
          );
    } catch (e) {
      yield* Stream.error(e);
    }
  }

  @override
  Future<Either<Failure, RepairOrderModel>> postOrder(
      PostOrderParams params) async {
    try {
      List<String> listFile = [];

      final DateTime dateTime = DateTime.now();

      RepairOrderModel order =
          params.order.copyWith(dateTime: dateTime).toModel();

      final dataRef = await _collRef.add(order);

      if (params.files.isNotEmpty) {
        for (var i = 0; i < params.files.length; i++) {
          await _storage
              .child('/${dataRef.id}/$i.png')
              .putFile(params.files[i]);

          String url =
              await _storage.child('/${dataRef.id}/$i.png').getDownloadURL();

          listFile.add(url);
        }
      }

      order = order.copyWith(id: dataRef.id, electronicPicture: listFile);

      await _collRef.doc(dataRef.id).update(order.toJson());

      await _technicianCollRef
          .doc(params.order.technicianUid)
          .update({"inOrder": true});

      final data = await _collRef.doc(dataRef.id).get();

      return Right(data.data()!);
    } on FirebaseException catch (e) {
      return Left(FirestoreFailure(e.code));
    }
  }

  @override
  Future<Either<Failure, RepairOrderModel>> acceptRepair(
      RepairOrder params) async {
    try {
      await firebase.collection('order').doc(params.id).update({
        'status': Status.perbaikanElektronik.name,
        'repair': true,
      });

      return Right(
        params
            .copyWith(
              status: Status.perbaikanElektronik.name,
              repair: true,
            )
            .toModel(),
      );
    } on FirebaseException catch (e) {
      return Left(FirestoreFailure(e.code));
    } catch (e) {
      return Left(FirestoreFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, RepairOrderModel>> rejectRepair(
      RepairOrder params) async {
    try {
      await firebase.collection('order').doc(params.id).update({
        'status': Status.pembayaran.name,
        'repair': false,
      });

      return Right(
        params
            .copyWith(
              status: Status.pembayaran.name,
              repair: false,
            )
            .toModel(),
      );
    } on FirebaseException catch (e) {
      return Left(FirestoreFailure(e.code));
    } catch (e) {
      return Left(FirestoreFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, RepairOrderModel>> paymentOrder(
      RepairOrder params) async {
    try {
      await firebase.collection('order').doc(params.id).update({
        'pay': true,
      });

      return Right(
        params
            .copyWith(
              pay: true,
            )
            .toModel(),
      );
    } on FirebaseException catch (e) {
      return Left(FirestoreFailure(e.code));
    } catch (e) {
      return Left(FirestoreFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, RepairOrderModel>> review(
      PostReviewParams params) async {
    try {
      final listImagesString = [];
      final review = params.review.toModel();
      final reviewDoc = await firebase
          .collection('technician')
          .doc(params.order.technicianUid)
          .collection('review')
          .add(review.toJson());

      final allReviewQuery = await firebase
          .collection('technician')
          .doc(params.order.technicianUid)
          .collection('review')
          .withConverter(
            fromFirestore: ReviewModel.fromFirestore,
            toFirestore: ReviewModel.toFirestore,
          )
          .get();

      if (params.files.isNotEmpty) {
        for (var i = 0; i < params.files.length; i++) {
          await _storage
              .child(
                  '/technician/${params.order.technicianUid}/${reviewDoc.id}$i.png')
              .putFile(params.files[i]);

          String url = await _storage
              .child(
                  '/technician/${params.order.technicianUid}/${reviewDoc.id}$i.png')
              .getDownloadURL();

          listImagesString.add(url);
        }
      }

      await firebase
          .collection('technician')
          .doc(params.order.technicianUid)
          .collection('review')
          .doc(reviewDoc.id)
          .update({'images': listImagesString});

      final allReview = allReviewQuery.docs.map((e) => e.data()).toList();

      int sum = 0;

      for (var review in allReview) {
        sum += review.rating!;
      }

      double arr = double.parse((sum / allReview.length).toStringAsFixed(1));

      await firebase
          .collection('technician')
          .doc(params.order.technicianUid)
          .update({
        'numberOfReviews': (params.technician.numberOfReviews ?? 0) + 1,
        'rating': arr,
      });

      await firebase.collection('order').doc(params.order.id).update({
        'status': Status.pesananSelesai.name,
      });

      return Right(
        params.order
            .copyWith(
              status: Status.pesananSelesai.name,
            )
            .toModel(),
      );
    } on FirebaseException catch (e) {
      return Left(FirestoreFailure(e.code));
    } catch (e) {
      return Left(FirestoreFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, RepairOrderModel>> cancelOrder(
      RepairOrder params) async {
    try {
      await firebase.collection('order').doc(params.id).update({
        'cancelled': true,
        'reasonCancelled': params.reasonCancelled,
      });

      return Right(
        params
            .copyWith(
              cancelled: true,
            )
            .toModel(),
      );
    } on FirebaseException catch (e) {
      return Left(FirestoreFailure(e.code));
    } catch (e) {
      return Left(FirestoreFailure(e.toString()));
    }
  }
}
