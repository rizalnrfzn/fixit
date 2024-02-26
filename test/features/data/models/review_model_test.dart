import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:fixit/features/features.dart';
import 'package:flutter_test/flutter_test.dart';

Future<void> main() async {
  final reviewModel = ReviewModel(
    clientUid: 'yhlObRZToLQhfJoJzv1Aykcy7B93',
    rating: 5,
    review: 'bagus',
    dateTime: DateTime.parse('2023-08-27T21:57:40.273702'),
  );

  final instance = FakeFirebaseFirestore();
  final collRef = instance
      .collection('technician')
      .doc('oR0HYrPbTfZMeKIRZjHw')
      .collection('review')
      .withConverter(
        fromFirestore: ReviewModel.fromFirestore,
        toFirestore: ReviewModel.toFirestore,
      );
  await collRef.add(reviewModel);

  test('from firestore, should return a valid review model from json',
      () async {
    // arrange
    final snapshot = await collRef.get();

    // act
    final model = snapshot.docs.first.data();

    // assert
    expect(model, equals(reviewModel));
  });
  test(
      'to firestore, should return a Map<String, dynamic> containing proper data',
      () {
    // arrange
    final reviewMap = {
      'clientUid': 'yhlObRZToLQhfJoJzv1Aykcy7B93',
      'clientName': null,
      'clientPicture': null,
      'rating': 5,
      'review': 'bagus',
      'dateTime': '2023-08-27T21:57:40.273702',
    };

    // act
    final result = ReviewModel.toFirestore(reviewModel, null);

    // assert
    expect(result, equals(reviewMap));
  });
}
