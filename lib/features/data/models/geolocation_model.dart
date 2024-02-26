import 'package:fixit/features/features.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geocoding/geocoding.dart';
import 'package:latlong2/latlong.dart';

part 'geolocation_model.freezed.dart';

@freezed
class GeolocationModel with _$GeolocationModel {
  factory GeolocationModel({
    LatLng? location,
    Placemark? placemark,
  }) = _GeolocationModel;

  GeolocationModel._();

  Geolocation toEntity() => Geolocation(
        location: location,
        placemark: placemark,
      );
}
