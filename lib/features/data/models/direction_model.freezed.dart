// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'direction_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DirectionModel _$DirectionModelFromJson(Map<String, dynamic> json) {
  return _DirectionModel.fromJson(json);
}

/// @nodoc
mixin _$DirectionModel {
  List<RouteModel>? get routes => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DirectionModelCopyWith<DirectionModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DirectionModelCopyWith<$Res> {
  factory $DirectionModelCopyWith(
          DirectionModel value, $Res Function(DirectionModel) then) =
      _$DirectionModelCopyWithImpl<$Res, DirectionModel>;
  @useResult
  $Res call({List<RouteModel>? routes});
}

/// @nodoc
class _$DirectionModelCopyWithImpl<$Res, $Val extends DirectionModel>
    implements $DirectionModelCopyWith<$Res> {
  _$DirectionModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? routes = freezed,
  }) {
    return _then(_value.copyWith(
      routes: freezed == routes
          ? _value.routes
          : routes // ignore: cast_nullable_to_non_nullable
              as List<RouteModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DirectionModelImplCopyWith<$Res>
    implements $DirectionModelCopyWith<$Res> {
  factory _$$DirectionModelImplCopyWith(_$DirectionModelImpl value,
          $Res Function(_$DirectionModelImpl) then) =
      __$$DirectionModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<RouteModel>? routes});
}

/// @nodoc
class __$$DirectionModelImplCopyWithImpl<$Res>
    extends _$DirectionModelCopyWithImpl<$Res, _$DirectionModelImpl>
    implements _$$DirectionModelImplCopyWith<$Res> {
  __$$DirectionModelImplCopyWithImpl(
      _$DirectionModelImpl _value, $Res Function(_$DirectionModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? routes = freezed,
  }) {
    return _then(_$DirectionModelImpl(
      routes: freezed == routes
          ? _value._routes
          : routes // ignore: cast_nullable_to_non_nullable
              as List<RouteModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DirectionModelImpl extends _DirectionModel {
  _$DirectionModelImpl({final List<RouteModel>? routes})
      : _routes = routes,
        super._();

  factory _$DirectionModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$DirectionModelImplFromJson(json);

  final List<RouteModel>? _routes;
  @override
  List<RouteModel>? get routes {
    final value = _routes;
    if (value == null) return null;
    if (_routes is EqualUnmodifiableListView) return _routes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'DirectionModel(routes: $routes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DirectionModelImpl &&
            const DeepCollectionEquality().equals(other._routes, _routes));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_routes));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DirectionModelImplCopyWith<_$DirectionModelImpl> get copyWith =>
      __$$DirectionModelImplCopyWithImpl<_$DirectionModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DirectionModelImplToJson(
      this,
    );
  }
}

abstract class _DirectionModel extends DirectionModel {
  factory _DirectionModel({final List<RouteModel>? routes}) =
      _$DirectionModelImpl;
  _DirectionModel._() : super._();

  factory _DirectionModel.fromJson(Map<String, dynamic> json) =
      _$DirectionModelImpl.fromJson;

  @override
  List<RouteModel>? get routes;
  @override
  @JsonKey(ignore: true)
  _$$DirectionModelImplCopyWith<_$DirectionModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RouteModel _$RouteModelFromJson(Map<String, dynamic> json) {
  return _RouteModel.fromJson(json);
}

/// @nodoc
mixin _$RouteModel {
  double? get duration => throw _privateConstructorUsedError;
  double? get distance => throw _privateConstructorUsedError;
  GmtryModel? get geometry => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RouteModelCopyWith<RouteModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RouteModelCopyWith<$Res> {
  factory $RouteModelCopyWith(
          RouteModel value, $Res Function(RouteModel) then) =
      _$RouteModelCopyWithImpl<$Res, RouteModel>;
  @useResult
  $Res call({double? duration, double? distance, GmtryModel? geometry});

  $GmtryModelCopyWith<$Res>? get geometry;
}

/// @nodoc
class _$RouteModelCopyWithImpl<$Res, $Val extends RouteModel>
    implements $RouteModelCopyWith<$Res> {
  _$RouteModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? duration = freezed,
    Object? distance = freezed,
    Object? geometry = freezed,
  }) {
    return _then(_value.copyWith(
      duration: freezed == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as double?,
      distance: freezed == distance
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as double?,
      geometry: freezed == geometry
          ? _value.geometry
          : geometry // ignore: cast_nullable_to_non_nullable
              as GmtryModel?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $GmtryModelCopyWith<$Res>? get geometry {
    if (_value.geometry == null) {
      return null;
    }

    return $GmtryModelCopyWith<$Res>(_value.geometry!, (value) {
      return _then(_value.copyWith(geometry: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$RouteModelImplCopyWith<$Res>
    implements $RouteModelCopyWith<$Res> {
  factory _$$RouteModelImplCopyWith(
          _$RouteModelImpl value, $Res Function(_$RouteModelImpl) then) =
      __$$RouteModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double? duration, double? distance, GmtryModel? geometry});

  @override
  $GmtryModelCopyWith<$Res>? get geometry;
}

/// @nodoc
class __$$RouteModelImplCopyWithImpl<$Res>
    extends _$RouteModelCopyWithImpl<$Res, _$RouteModelImpl>
    implements _$$RouteModelImplCopyWith<$Res> {
  __$$RouteModelImplCopyWithImpl(
      _$RouteModelImpl _value, $Res Function(_$RouteModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? duration = freezed,
    Object? distance = freezed,
    Object? geometry = freezed,
  }) {
    return _then(_$RouteModelImpl(
      duration: freezed == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as double?,
      distance: freezed == distance
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as double?,
      geometry: freezed == geometry
          ? _value.geometry
          : geometry // ignore: cast_nullable_to_non_nullable
              as GmtryModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RouteModelImpl extends _RouteModel {
  _$RouteModelImpl({this.duration, this.distance, this.geometry}) : super._();

  factory _$RouteModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$RouteModelImplFromJson(json);

  @override
  final double? duration;
  @override
  final double? distance;
  @override
  final GmtryModel? geometry;

  @override
  String toString() {
    return 'RouteModel(duration: $duration, distance: $distance, geometry: $geometry)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RouteModelImpl &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.distance, distance) ||
                other.distance == distance) &&
            (identical(other.geometry, geometry) ||
                other.geometry == geometry));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, duration, distance, geometry);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RouteModelImplCopyWith<_$RouteModelImpl> get copyWith =>
      __$$RouteModelImplCopyWithImpl<_$RouteModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RouteModelImplToJson(
      this,
    );
  }
}

abstract class _RouteModel extends RouteModel {
  factory _RouteModel(
      {final double? duration,
      final double? distance,
      final GmtryModel? geometry}) = _$RouteModelImpl;
  _RouteModel._() : super._();

  factory _RouteModel.fromJson(Map<String, dynamic> json) =
      _$RouteModelImpl.fromJson;

  @override
  double? get duration;
  @override
  double? get distance;
  @override
  GmtryModel? get geometry;
  @override
  @JsonKey(ignore: true)
  _$$RouteModelImplCopyWith<_$RouteModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

GmtryModel _$GmtryModelFromJson(Map<String, dynamic> json) {
  return _GmtryModel.fromJson(json);
}

/// @nodoc
mixin _$GmtryModel {
  @ListLatLngJsonConverter()
  List<LatLng>? get coordinates => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GmtryModelCopyWith<GmtryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GmtryModelCopyWith<$Res> {
  factory $GmtryModelCopyWith(
          GmtryModel value, $Res Function(GmtryModel) then) =
      _$GmtryModelCopyWithImpl<$Res, GmtryModel>;
  @useResult
  $Res call(
      {@ListLatLngJsonConverter() List<LatLng>? coordinates, String? type});
}

/// @nodoc
class _$GmtryModelCopyWithImpl<$Res, $Val extends GmtryModel>
    implements $GmtryModelCopyWith<$Res> {
  _$GmtryModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? coordinates = freezed,
    Object? type = freezed,
  }) {
    return _then(_value.copyWith(
      coordinates: freezed == coordinates
          ? _value.coordinates
          : coordinates // ignore: cast_nullable_to_non_nullable
              as List<LatLng>?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GmtryModelImplCopyWith<$Res>
    implements $GmtryModelCopyWith<$Res> {
  factory _$$GmtryModelImplCopyWith(
          _$GmtryModelImpl value, $Res Function(_$GmtryModelImpl) then) =
      __$$GmtryModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@ListLatLngJsonConverter() List<LatLng>? coordinates, String? type});
}

/// @nodoc
class __$$GmtryModelImplCopyWithImpl<$Res>
    extends _$GmtryModelCopyWithImpl<$Res, _$GmtryModelImpl>
    implements _$$GmtryModelImplCopyWith<$Res> {
  __$$GmtryModelImplCopyWithImpl(
      _$GmtryModelImpl _value, $Res Function(_$GmtryModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? coordinates = freezed,
    Object? type = freezed,
  }) {
    return _then(_$GmtryModelImpl(
      coordinates: freezed == coordinates
          ? _value._coordinates
          : coordinates // ignore: cast_nullable_to_non_nullable
              as List<LatLng>?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GmtryModelImpl extends _GmtryModel {
  _$GmtryModelImpl(
      {@ListLatLngJsonConverter() final List<LatLng>? coordinates, this.type})
      : _coordinates = coordinates,
        super._();

  factory _$GmtryModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$GmtryModelImplFromJson(json);

  final List<LatLng>? _coordinates;
  @override
  @ListLatLngJsonConverter()
  List<LatLng>? get coordinates {
    final value = _coordinates;
    if (value == null) return null;
    if (_coordinates is EqualUnmodifiableListView) return _coordinates;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? type;

  @override
  String toString() {
    return 'GmtryModel(coordinates: $coordinates, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GmtryModelImpl &&
            const DeepCollectionEquality()
                .equals(other._coordinates, _coordinates) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_coordinates), type);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GmtryModelImplCopyWith<_$GmtryModelImpl> get copyWith =>
      __$$GmtryModelImplCopyWithImpl<_$GmtryModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GmtryModelImplToJson(
      this,
    );
  }
}

abstract class _GmtryModel extends GmtryModel {
  factory _GmtryModel(
      {@ListLatLngJsonConverter() final List<LatLng>? coordinates,
      final String? type}) = _$GmtryModelImpl;
  _GmtryModel._() : super._();

  factory _GmtryModel.fromJson(Map<String, dynamic> json) =
      _$GmtryModelImpl.fromJson;

  @override
  @ListLatLngJsonConverter()
  List<LatLng>? get coordinates;
  @override
  String? get type;
  @override
  @JsonKey(ignore: true)
  _$$GmtryModelImplCopyWith<_$GmtryModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
