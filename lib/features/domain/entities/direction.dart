import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:latlong2/latlong.dart';

part 'direction.freezed.dart';

@freezed
class Direction with _$Direction {
  factory Direction({
    List<Rute>? routes,
  }) = _Direction;
}

@freezed
class Rute with _$Rute {
  factory Rute({
    double? duration,
    double? distance,
    Gmtry? geometry,
  }) = _Route;
}

@freezed
class Gmtry with _$Gmtry {
  factory Gmtry({
    List<LatLng>? coordinates,
    String? type,
  }) = _Gmtry;
}
