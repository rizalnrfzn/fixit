import 'dart:convert';

import 'package:fixit/features/features.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../helpers/json_reader.dart';
import '../../../helpers/paths.dart';

void main() {
  final loginResponse = AuthUserModel(
    uid: 'yhlObRZToLQhfJoJzv1Aykcy7B93',
    email: 'levelsekawan@gmail.com',
    name: 'level sekawan',
    phoneNumber: '0896754631666',
    profilePicture:
        'https://firebasestorage.googleapis.com/v0/b/fixit-1c96e.appspot.com/o/client%2FyhlObRZToLQhfJoJzv1Aykcy7B93%2FprofilePicture.png?alt=media&token=4cc649b2-4ea8-46ef-a916-251390fe6577',
    address: null,
    location: null,
    isRegistered: true,
  );

  test('from json, should return a valid model from json', () {
    // arrange
    final jsonMap = json.decode(jsonReader(loginSuccessResponsePath));

    // act
    final result = AuthUserModel.fromJson(jsonMap as Map<String, dynamic>);

    // assert
    expect(result, equals(loginResponse));
  });

  test('to json, should return a json map containing proper data', () {
    // arrange
    final expectedJson = {
      "uid": "yhlObRZToLQhfJoJzv1Aykcy7B93",
      "email": "levelsekawan@gmail.com",
      "name": "level sekawan",
      "phoneNumber": "0896754631666",
      "profilePicture":
          "https://firebasestorage.googleapis.com/v0/b/fixit-1c96e.appspot.com/o/client%2FyhlObRZToLQhfJoJzv1Aykcy7B93%2FprofilePicture.png?alt=media&token=4cc649b2-4ea8-46ef-a916-251390fe6577",
      "address": null,
      "location": null,
      "isRegistered": true
    };

    // act
    final result = loginResponse.toJson();

    // assert
    expect(result, equals(expectedJson));
  });
}
