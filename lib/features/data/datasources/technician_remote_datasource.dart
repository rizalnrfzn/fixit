import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fixit/features/features.dart';

abstract class TechnicianRemoteDatasource {
  Stream<List<TechnicianModel>> streamTechnicians();

  Stream<List<ReviewModel>> streamReviews(String uid);
}

class TechniciansRemoteDatasourceImpl implements TechnicianRemoteDatasource {
  final _technicianCollRef =
      FirebaseFirestore.instance.collection('technician').withConverter(
            fromFirestore: TechnicianModel.fromFirestore,
            toFirestore: TechnicianModel.toFirestore,
          );

  @override
  Stream<List<TechnicianModel>> streamTechnicians() async* {
    try {
      yield* _technicianCollRef
          .where('isVerified', isEqualTo: true)
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
  Stream<List<ReviewModel>> streamReviews(String uid) async* {
    final collRef = FirebaseFirestore.instance
        .collection('technician')
        .doc(uid)
        .collection('review')
        .withConverter(
          fromFirestore: ReviewModel.fromFirestore,
          toFirestore: ReviewModel.toFirestore,
        );

    try {
      yield* collRef.orderBy('dateTime', descending: true).snapshots().map(
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
}
