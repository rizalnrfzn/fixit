import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geocoding/geocoding.dart';
import 'package:latlong2/latlong.dart';

part 'geolocation.freezed.dart';

@freezed
class Geolocation with _$Geolocation {
  factory Geolocation({
    LatLng? location,
    Placemark? placemark,
  }) = _Geolocation;
}
