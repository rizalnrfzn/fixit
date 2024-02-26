// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'direction_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DirectionModelImpl _$$DirectionModelImplFromJson(Map<String, dynamic> json) =>
    _$DirectionModelImpl(
      routes: (json['routes'] as List<dynamic>?)
          ?.map((e) => RouteModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$DirectionModelImplToJson(
        _$DirectionModelImpl instance) =>
    <String, dynamic>{
      'routes': instance.routes,
    };

_$RouteModelImpl _$$RouteModelImplFromJson(Map<String, dynamic> json) =>
    _$RouteModelImpl(
      duration: (json['duration'] as num?)?.toDouble(),
      distance: (json['distance'] as num?)?.toDouble(),
      geometry: json['geometry'] == null
          ? null
          : GmtryModel.fromJson(json['geometry'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$RouteModelImplToJson(_$RouteModelImpl instance) =>
    <String, dynamic>{
      'duration': instance.duration,
      'distance': instance.distance,
      'geometry': instance.geometry,
    };

_$GmtryModelImpl _$$GmtryModelImplFromJson(Map<String, dynamic> json) =>
    _$GmtryModelImpl(
      coordinates: _$JsonConverterFromJson<List<dynamic>, List<LatLng>>(
          json['coordinates'], const ListLatLngJsonConverter().fromJson),
      type: json['type'] as String?,
    );

Map<String, dynamic> _$$GmtryModelImplToJson(_$GmtryModelImpl instance) =>
    <String, dynamic>{
      'coordinates': _$JsonConverterToJson<List<dynamic>, List<LatLng>>(
          instance.coordinates, const ListLatLngJsonConverter().toJson),
      'type': instance.type,
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);
