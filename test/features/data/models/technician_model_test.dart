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
    electronics: ['televisi', 'ac'],
    email: 'aksdjfakls@jgakfmal.dfj',
    images: ['ksdhfjasdhasf', 'aksjdfja'],
    isOnline: true,
    inOrder: false,
    uid: 'skdjflaksdf',
    isVerified: true,
    name: 'ckadkhfasjdfh',
    numberOfReviews: 0,
    phoneNumber: '08919027840312',
    profilePicture: 'kashdfahsdj',
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
      'electronics': ['televisi', 'ac'],
      'email': 'aksdjfakls@jgakfmal.dfj',
      'images': ['ksdhfjasdhasf'],
      'isOnline': true,
      'inOrder': false,
      'uid': 'skdjflaksdf',
      'isVerified': true,
      'name': 'ckadkhfasjdfh',
      'numberOfReviews': 0,
      'phoneNumber': '08919027840312',
      'profilePicture': 'kashdfahsdj',
      'rating': 0,
    };

    // act
    final result = TechnicianModel.toFirestore(technicianModel, null);

    // assert
    expect(result, equals(technicianMap));
  });
}
