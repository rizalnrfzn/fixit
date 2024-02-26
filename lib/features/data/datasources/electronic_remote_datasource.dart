import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fixit/features/features.dart';

abstract class ElectronicRemoteDatasource {
  Stream<List<ElectronicModel>> streamElectronics();
}

class ElectronicRemoteDatasourceImpl implements ElectronicRemoteDatasource {
  final _collRef = FirebaseFirestore.instance
      .collection('electronic')
      .withConverter<ElectronicModel>(
          fromFirestore: ElectronicModel.fromFirestore,
          toFirestore: ElectronicModel.toFirestore);

  @override
  Stream<List<ElectronicModel>> streamElectronics() async* {
    try {
      yield* _collRef.snapshots().map(
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
