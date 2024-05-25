import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:latlong2/latlong.dart';

class LatLngJsonConverter implements JsonConverter<LatLng, List<double>> {
  const LatLngJsonConverter();

  @override
  LatLng fromJson(List<double> json) {
    return LatLng(json[1], json[0]);
  }

  @override
  List<double> toJson(LatLng object) {
    return [object.longitude, object.latitude];
  }
}
