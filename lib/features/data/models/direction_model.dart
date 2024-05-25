import 'package:fixit/features/features.dart';
import 'package:fixit/utils/utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:latlong2/latlong.dart';

part 'direction_model.freezed.dart';
part 'direction_model.g.dart';

@freezed
class DirectionModel with _$DirectionModel {
  factory DirectionModel({
    List<RouteModel>? routes,
  }) = _DirectionModel;

  DirectionModel._();

  factory DirectionModel.fromJson(Map<String, dynamic> json) =>
      _$DirectionModelFromJson(json);

  Direction toEntity() => Direction(
        routes: routes
            ?.map(
              (e) => e.toEntity(),
            )
            .toList(),
      );
}

@freezed
class RouteModel with _$RouteModel {
  factory RouteModel({
    double? duration,
    double? distance,
    GmtryModel? geometry,
  }) = _RouteModel;

  RouteModel._();

  factory RouteModel.fromJson(Map<String, dynamic> json) =>
      _$RouteModelFromJson(json);

  Rute toEntity() => Rute(
        duration: duration,
        distance: distance,
        geometry: geometry?.toEntity(),
      );
}

@freezed
class GmtryModel with _$GmtryModel {
  factory GmtryModel({
    @ListLatLngJsonConverter() List<LatLng>? coordinates,
    String? type,
  }) = _GmtryModel;

  GmtryModel._();

  factory GmtryModel.fromJson(Map<String, dynamic> json) =>
      _$GmtryModelFromJson(json);

  Gmtry toEntity() => Gmtry(
        coordinates: coordinates,
        type: type,
      );
}
