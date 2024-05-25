import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

class GeoPointConverter implements JsonConverter<GeoPoint, List<double>> {
  const GeoPointConverter();

  @override
  GeoPoint fromJson(List<double> json) {
    return GeoPoint(json[0], json[1]);
  }

  @override
  List<double> toJson(GeoPoint object) {
    return [object.latitude, object.longitude];
  }
}
