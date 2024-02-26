// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'electronic_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ElectronicModelImpl _$$ElectronicModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ElectronicModelImpl(
      id: json['id'] as String?,
      name: json['name'] as String?,
      englishName: json['englishName'] as String?,
      description: json['description'] as String?,
      image: json['image'] as String?,
      gripe:
          (json['gripe'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$ElectronicModelImplToJson(
        _$ElectronicModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'englishName': instance.englishName,
      'description': instance.description,
      'image': instance.image,
      'gripe': instance.gripe,
    };
