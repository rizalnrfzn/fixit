// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'banner_ad.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$BannerAd {
  String? get id => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;
  String? get routes => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BannerAdCopyWith<BannerAd> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BannerAdCopyWith<$Res> {
  factory $BannerAdCopyWith(BannerAd value, $Res Function(BannerAd) then) =
      _$BannerAdCopyWithImpl<$Res, BannerAd>;
  @useResult
  $Res call({String? id, String? description, String? image, String? routes});
}

/// @nodoc
class _$BannerAdCopyWithImpl<$Res, $Val extends BannerAd>
    implements $BannerAdCopyWith<$Res> {
  _$BannerAdCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? description = freezed,
    Object? image = freezed,
    Object? routes = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      routes: freezed == routes
          ? _value.routes
          : routes // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BannerAdImplCopyWith<$Res>
    implements $BannerAdCopyWith<$Res> {
  factory _$$BannerAdImplCopyWith(
          _$BannerAdImpl value, $Res Function(_$BannerAdImpl) then) =
      __$$BannerAdImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? id, String? description, String? image, String? routes});
}

/// @nodoc
class __$$BannerAdImplCopyWithImpl<$Res>
    extends _$BannerAdCopyWithImpl<$Res, _$BannerAdImpl>
    implements _$$BannerAdImplCopyWith<$Res> {
  __$$BannerAdImplCopyWithImpl(
      _$BannerAdImpl _value, $Res Function(_$BannerAdImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? description = freezed,
    Object? image = freezed,
    Object? routes = freezed,
  }) {
    return _then(_$BannerAdImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      routes: freezed == routes
          ? _value.routes
          : routes // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$BannerAdImpl extends _BannerAd {
  _$BannerAdImpl({this.id, this.description, this.image, this.routes})
      : super._();

  @override
  final String? id;
  @override
  final String? description;
  @override
  final String? image;
  @override
  final String? routes;

  @override
  String toString() {
    return 'BannerAd(id: $id, description: $description, image: $image, routes: $routes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BannerAdImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.routes, routes) || other.routes == routes));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, description, image, routes);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BannerAdImplCopyWith<_$BannerAdImpl> get copyWith =>
      __$$BannerAdImplCopyWithImpl<_$BannerAdImpl>(this, _$identity);
}

abstract class _BannerAd extends BannerAd {
  factory _BannerAd(
      {final String? id,
      final String? description,
      final String? image,
      final String? routes}) = _$BannerAdImpl;
  _BannerAd._() : super._();

  @override
  String? get id;
  @override
  String? get description;
  @override
  String? get image;
  @override
  String? get routes;
  @override
  @JsonKey(ignore: true)
  _$$BannerAdImplCopyWith<_$BannerAdImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
