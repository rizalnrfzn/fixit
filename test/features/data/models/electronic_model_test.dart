import 'dart:convert';

import 'package:fixit/features/features.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../helpers/json_reader.dart';
import '../../../helpers/paths.dart';

void main() {
  final electronicModel = ElectronicModel(
      description: "ini AC",
      gripe: ["keluhan ac 1", "keluhan ac 2"],
      id: "12UtbGEah9DXFNr9l1vv",
      image:
          "https://firebasestorage.googleapis.com/v0/b/fixit-1c96e.appspot.com/o/electronic%2Fac.png?alt=media&token=e24d8a17-c93b-4eeb-b496-3c9d2ea30002",
      name: "Air Conditioner");

  test('from json, should return a valid electronic model from json', () {
    // arrange
    final jsonMap = json.decode(jsonReader(electronicSuccessResponsePath));

    // act
    final result = ElectronicModel.fromJson(jsonMap);

    // assert
    expect(result, equals(electronicModel));
  });

  test('to json, should return a json map containing proper data', () {
    // arrange
    final expectedJson = {
      "description": "ini AC",
      "gripe": ["keluhan ac 1", "keluhan ac 2"],
      "id": "12UtbGEah9DXFNr9l1vv",
      "image":
          "https://firebasestorage.googleapis.com/v0/b/fixit-1c96e.appspot.com/o/electronic%2Fac.png?alt=media&token=e24d8a17-c93b-4eeb-b496-3c9d2ea30002",
      "name": "Air Conditioner"
    };

    // act
    final result = electronicModel.toJson();

    // assert
    expect(result, equals(expectedJson));
  });
}
