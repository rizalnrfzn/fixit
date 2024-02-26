// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'technician_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TechnicianModelImpl _$$TechnicianModelImplFromJson(
        Map<String, dynamic> json) =>
    _$TechnicianModelImpl(
      uid: json['uid'] as String?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      description: json['description'] as String?,
      profilePicture: json['profilePicture'] as String?,
      images:
          (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
      address: json['address'] as String?,
      location: _$JsonConverterFromJson<GeoPoint, LatLng>(
          json['location'], const LatLngConverter().fromJson),
      currentLocation: _$JsonConverterFromJson<GeoPoint, LatLng>(
          json['currentLocation'], const LatLngConverter().fromJson),
      electronics: (json['electronics'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      isVerified: json['isVerified'] as bool?,
      isOnline: json['isOnline'] as bool?,
      inOrder: json['inOrder'] as bool?,
      rating: (json['rating'] as num?)?.toDouble(),
      numberOfReviews: json['numberOfReviews'] as int?,
    );

Map<String, dynamic> _$$TechnicianModelImplToJson(
        _$TechnicianModelImpl instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'name': instance.name,
      'email': instance.email,
      'phoneNumber': instance.phoneNumber,
      'description': instance.description,
      'profilePicture': instance.profilePicture,
      'images': instance.images,
      'address': instance.address,
      'location': _$JsonConverterToJson<GeoPoint, LatLng>(
          instance.location, const LatLngConverter().toJson),
      'currentLocation': _$JsonConverterToJson<GeoPoint, LatLng>(
          instance.currentLocation, const LatLngConverter().toJson),
      'electronics': instance.electronics,
      'isVerified': instance.isVerified,
      'isOnline': instance.isOnline,
      'inOrder': instance.inOrder,
      'rating': instance.rating,
      'numberOfReviews': instance.numberOfReviews,
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
