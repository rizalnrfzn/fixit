// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'electronic_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ElectronicModel _$ElectronicModelFromJson(Map<String, dynamic> json) {
  return _ElectronicModel.fromJson(json);
}

/// @nodoc
mixin _$ElectronicModel {
  String? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get englishName => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;
  List<String>? get gripe => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ElectronicModelCopyWith<ElectronicModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ElectronicModelCopyWith<$Res> {
  factory $ElectronicModelCopyWith(
          ElectronicModel value, $Res Function(ElectronicModel) then) =
      _$ElectronicModelCopyWithImpl<$Res, ElectronicModel>;
  @useResult
  $Res call(
      {String? id,
      String? name,
      String? englishName,
      String? description,
      String? image,
      List<String>? gripe});
}

/// @nodoc
class _$ElectronicModelCopyWithImpl<$Res, $Val extends ElectronicModel>
    implements $ElectronicModelCopyWith<$Res> {
  _$ElectronicModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? englishName = freezed,
    Object? description = freezed,
    Object? image = freezed,
    Object? gripe = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      englishName: freezed == englishName
          ? _value.englishName
          : englishName // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      gripe: freezed == gripe
          ? _value.gripe
          : gripe // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ElectronicModelImplCopyWith<$Res>
    implements $ElectronicModelCopyWith<$Res> {
  factory _$$ElectronicModelImplCopyWith(_$ElectronicModelImpl value,
          $Res Function(_$ElectronicModelImpl) then) =
      __$$ElectronicModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String? name,
      String? englishName,
      String? description,
      String? image,
      List<String>? gripe});
}

/// @nodoc
class __$$ElectronicModelImplCopyWithImpl<$Res>
    extends _$ElectronicModelCopyWithImpl<$Res, _$ElectronicModelImpl>
    implements _$$ElectronicModelImplCopyWith<$Res> {
  __$$ElectronicModelImplCopyWithImpl(
      _$ElectronicModelImpl _value, $Res Function(_$ElectronicModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? englishName = freezed,
    Object? description = freezed,
    Object? image = freezed,
    Object? gripe = freezed,
  }) {
    return _then(_$ElectronicModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      englishName: freezed == englishName
          ? _value.englishName
          : englishName // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      gripe: freezed == gripe
          ? _value._gripe
          : gripe // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ElectronicModelImpl extends _ElectronicModel {
  _$ElectronicModelImpl(
      {this.id,
      this.name,
      this.englishName,
      this.description,
      this.image,
      final List<String>? gripe})
      : _gripe = gripe,
        super._();

  factory _$ElectronicModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ElectronicModelImplFromJson(json);

  @override
  final String? id;
  @override
  final String? name;
  @override
  final String? englishName;
  @override
  final String? description;
  @override
  final String? image;
  final List<String>? _gripe;
  @override
  List<String>? get gripe {
    final value = _gripe;
    if (value == null) return null;
    if (_gripe is EqualUnmodifiableListView) return _gripe;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ElectronicModel(id: $id, name: $name, englishName: $englishName, description: $description, image: $image, gripe: $gripe)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ElectronicModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.englishName, englishName) ||
                other.englishName == englishName) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.image, image) || other.image == image) &&
            const DeepCollectionEquality().equals(other._gripe, _gripe));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, englishName,
      description, image, const DeepCollectionEquality().hash(_gripe));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ElectronicModelImplCopyWith<_$ElectronicModelImpl> get copyWith =>
      __$$ElectronicModelImplCopyWithImpl<_$ElectronicModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ElectronicModelImplToJson(
      this,
    );
  }
}

abstract class _ElectronicModel extends ElectronicModel {
  factory _ElectronicModel(
      {final String? id,
      final String? name,
      final String? englishName,
      final String? description,
      final String? image,
      final List<String>? gripe}) = _$ElectronicModelImpl;
  _ElectronicModel._() : super._();

  factory _ElectronicModel.fromJson(Map<String, dynamic> json) =
      _$ElectronicModelImpl.fromJson;

  @override
  String? get id;
  @override
  String? get name;
  @override
  String? get englishName;
  @override
  String? get description;
  @override
  String? get image;
  @override
  List<String>? get gripe;
  @override
  @JsonKey(ignore: true)
  _$$ElectronicModelImplCopyWith<_$ElectronicModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
