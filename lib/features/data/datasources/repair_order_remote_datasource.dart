import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:fixit/core/core.dart';
import 'package:fixit/features/features.dart';

abstract class RepairOrderRemoteDatasource {
  Stream<List<RepairOrderModel>> streamRepairOrders(String uid);

  Future<Either<Failure, RepairOrderModel>> postOrder(PostOrderParams params);
}

class RepairOrderRemoteDatasourceImpl implements RepairOrderRemoteDatasource {
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
}
