import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:latlong2/latlong.dart';

class ListLatLngConverter
    implements JsonConverter<List<LatLng>, List<dynamic>> {
  const ListLatLngConverter();

  @override
  List<LatLng> fromJson(List<dynamic> json) {
    List<LatLng> routes = [];
    for (var point in json) {
      routes.add(LatLng(point.latitude, point.longitude));
    }
    return routes;
  }

  @override
  List<dynamic> toJson(List<LatLng> object) {
    List<dynamic> routes = [];
    for (var point in object) {
      routes.add(GeoPoint(point.latitude, point.longitude));
    }

    return routes;
  }

  // @override
  // List<LatLng> fromJson(List<GeoPoint> json) {
  //   List<LatLng> route = [];
  //   for (var point in json) {
  //     route.add(LatLng(point.latitude, point.longitude));
  //   }

  //   return route;
  // }

  // @override
  // List<GeoPoint> toJson(List<LatLng> object) {
  //   List<GeoPoint> route = [];
  //   for (var point in object) {
  //     route.add(GeoPoint(point.latitude, point.longitude));
  //   }

  //   return route;
  // }
}
