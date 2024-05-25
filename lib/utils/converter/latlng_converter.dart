import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:latlong2/latlong.dart';

class LatLngConverter implements JsonConverter<LatLng, GeoPoint> {
  const LatLngConverter();

  @override
  LatLng fromJson(GeoPoint json) {
    return LatLng(json.latitude, json.longitude);
  }

  @override
  GeoPoint toJson(LatLng object) {
    return GeoPoint(object.latitude, object.longitude);
  }
}
