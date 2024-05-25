import 'package:json_annotation/json_annotation.dart';
import 'package:latlong2/latlong.dart';

class ListLatLngJsonConverter
    implements JsonConverter<List<LatLng>, List<dynamic>> {
  const ListLatLngJsonConverter();

  @override
  List<LatLng> fromJson(List<dynamic> json) {
    List<LatLng> routes = [];
    for (var point in json) {
      routes.add(LatLng(point[1], point[0]));
    }

    return routes;
  }

  @override
  List<dynamic> toJson(List<LatLng> object) {
    List<dynamic> routes = [];
    for (var point in object) {
      routes.add([point.longitude, point.latitude]);
    }

    return routes;
  }

  // @override
  // List<LatLng> fromJson(List<dynamic> json) {
  //   List<LatLng> routes = [];
  //   for (var point in json) {
  //     routes.add(LatLng(point[1], point[0]));
  //   }

  //   return routes;
  // }

  // @override
  // List<dynamic>> toJson(List<LatLng> object) {
  //   List<dynamic> routes = [];
  //   for (var point in object) {
  //     routes.add([point.longitude, point.latitude]);
  //   }

  //   return routes;
  // }
}
