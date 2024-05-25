import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:fixit/features/features.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:latlong2/latlong.dart';

Future<void> main() async {
  final technicianModel = TechnicianModel(
    address: 'mewek',
    description: 'ini deskripsi',
    currentLocation: const LatLng(-7.4048233479, 109.362945327),
    location: const LatLng(-7.4048233479, 109.362945327),
    electronicId: ['12UtbGEah9DXFNr9l1vv', 'DVy2PJgs5XQrMQppUHxx'],
    email: 'aksdjfakls@jgakfmal.dfj',
    images: [
      'https://firebasestorage.googleapis.com/v0/b/fixit-1c96e.appspot.com/o/technician%2FmwCuUKWiU1XoEBIWVn6PPeUEORf2%2Fimages%2F0.png?alt=media&token=85fd819b-ac03-4545-8f66-09365fc38d07',
      'https://firebasestorage.googleapis.com/v0/b/fixit-1c96e.appspot.com/o/technician%2FmwCuUKWiU1XoEBIWVn6PPeUEORf2%2Fimages%2F1.png?alt=media&token=cadccbe4-959e-4157-b3eb-150a8fff6879'
    ],
    isOnline: true,
    inOrder: false,
    uid: 'skdjflaksdf',
    isVerified: true,
    name: 'ckadkhfasjdfh',
    numberOfReviews: 0,
    phoneNumber: '08919027840312',
    profilePicture:
        'https://firebasestorage.googleapis.com/v0/b/fixit-1c96e.appspot.com/o/technician%2FmwCuUKWiU1XoEBIWVn6PPeUEORf2%2Fimages%2FprofilePicture.png?alt=media&token=20c93480-c48a-47c6-9f9e-66d3c11aa055',
    rating: 0,
  );

  final instance = FakeFirebaseFirestore();
  final collRef = instance.collection('technician').withConverter(
        fromFirestore: TechnicianModel.fromFirestore,
        toFirestore: TechnicianModel.toFirestore,
      );
  await collRef.add(technicianModel);

  test('from firestore, should return a valid review model from json',
      () async {
    // arrange
    final snapshot = await collRef.get();

    // act
    final model = snapshot.docs.first.data();

    // assert
    expect(model.uid, (technicianModel.uid));
  });

  test(
      'to firestore, should return a Map<String, dynamic> containing proper data',
      () {
    // arrange
    final technicianMap = {
      'address': 'mewek',
      'description': 'ini deskripsi',
      'currentLocation': const GeoPoint(-7.4048233479, 109.362945327),
      'location': const GeoPoint(-7.4048233479, 109.362945327),
      'electronicId': ['12UtbGEah9DXFNr9l1vv', 'DVy2PJgs5XQrMQppUHxx'],
      'email': 'aksdjfakls@jgakfmal.dfj',
      'images': [
        'https://firebasestorage.googleapis.com/v0/b/fixit-1c96e.appspot.com/o/technician%2FmwCuUKWiU1XoEBIWVn6PPeUEORf2%2Fimages%2F0.png?alt=media&token=85fd819b-ac03-4545-8f66-09365fc38d07',
        'https://firebasestorage.googleapis.com/v0/b/fixit-1c96e.appspot.com/o/technician%2FmwCuUKWiU1XoEBIWVn6PPeUEORf2%2Fimages%2F1.png?alt=media&token=cadccbe4-959e-4157-b3eb-150a8fff6879'
      ],
      'isOnline': true,
      'inOrder': false,
      'uid': 'skdjflaksdf',
      'isVerified': true,
      'name': 'ckadkhfasjdfh',
      'numberOfReviews': 0,
      'phoneNumber': '08919027840312',
      'profilePicture':
          'https://firebasestorage.googleapis.com/v0/b/fixit-1c96e.appspot.com/o/technician%2FmwCuUKWiU1XoEBIWVn6PPeUEORf2%2Fimages%2FprofilePicture.png?alt=media&token=20c93480-c48a-47c6-9f9e-66d3c11aa055',
      'rating': 0,
    };

    // act
    final result = TechnicianModel.toFirestore(technicianModel, null);

    // assert
    expect(result, equals(technicianMap));
  });
}
