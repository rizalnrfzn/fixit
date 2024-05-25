import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:fixit/features/features.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:latlong2/latlong.dart';

Future<void> main() async {
  final repairOrderModel = RepairOrderModel(
    cancelled: false,
    checkingCost: 5000,
    clientAddress: "Mewek",
    clientLocation: const LatLng(-7.4453228, 109.2662425),
    clientUid: "yhlObRZToLQhfJoJzv1Aykcy7B93",
    damage: [],
    dateTime: DateTime.parse("2024-01-08T09:29:40.315149"),
    distance: 39483,
    duration: 92738,
    electronicId: "Televisi",
    electronicPicture: [],
    gripe: ["keluhan televisi 1"],
    id: "bVCfX1rzV0bucLNFrQ4X",
    pay: false,
    repair: false,
    repairCost: 50000,
    status: "onlie",
    technicianLocation: const LatLng(-7.4453228, 109.2662425),
    technicianUid: "oR0HYrPbTfZMeKIRZjHw",
    totalCost: 55000,
    reasonCancelled: 'tidak ada sparepart',
  );

  final instance = FakeFirebaseFirestore();
  final collRef = instance.collection('order').withConverter(
        fromFirestore: RepairOrderModel.fromFirestore,
        toFirestore: RepairOrderModel.toFirestore,
      );

  await collRef.add(repairOrderModel);

  test('from firestore, should return a valid repair order model from json',
      () async {
    // arrange
    final snapshot = await collRef.get();

    // act
    final model = snapshot.docs.first.data();

    // assert
    expect(model, equals(repairOrderModel));
  });

  test(
      'to firestore, should return a Map<String, dynamic> containing proper data',
      () {
    // arrange
    final repairOrderMap = {
      'cancelled': false,
      'checkingCost': 5000,
      'clientAddress': "Mewek",
      'clientLocation': const GeoPoint(-7.4453228, 109.2662425),
      'clientUid': "yhlObRZToLQhfJoJzv1Aykcy7B93",
      'damage': [],
      'dateTime':
          Timestamp.fromDate(DateTime.parse('2024-01-08T09:29:40.315149')),
      'distance': 39483,
      'duration': 92738,
      'electronicId': "Televisi",
      'electronicPicture': [],
      'gripe': ["keluhan televisi 1"],
      'id': "bVCfX1rzV0bucLNFrQ4X",
      'pay': false,
      'repair': false,
      'repairCost': 50000,
      'status': "onlie",
      'technicianLocation': const GeoPoint(-7.4453228, 109.2662425),
      'technicianUid': "oR0HYrPbTfZMeKIRZjHw",
      'totalCost': 55000,
      'reasonCancelled': 'tidak ada sparepart',
    };

    // act
    final result = RepairOrderModel.toFirestore(repairOrderModel, null);

    // assert
    expect(result, equals(repairOrderMap));
  });
}
