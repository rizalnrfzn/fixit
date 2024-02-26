// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'review.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Review {
  String? get clientUid => throw _privateConstructorUsedError;
  String? get clientName => throw _privateConstructorUsedError;
  String? get clientPicture => throw _privateConstructorUsedError;
  String? get review => throw _privateConstructorUsedError;
  int? get rating => throw _privateConstructorUsedError;
  DateTime? get dateTime => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ReviewCopyWith<Review> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReviewCopyWith<$Res> {
  factory $ReviewCopyWith(Review value, $Res Function(Review) then) =
      _$ReviewCopyWithImpl<$Res, Review>;
  @useResult
  $Res call(
      {String? clientUid,
      String? clientName,
      String? clientPicture,
      String? review,
      int? rating,
      DateTime? dateTime});
}

/// @nodoc
class _$ReviewCopyWithImpl<$Res, $Val extends Review>
    implements $ReviewCopyWith<$Res> {
  _$ReviewCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? clientUid = freezed,
    Object? clientName = freezed,
    Object? clientPicture = freezed,
    Object? review = freezed,
    Object? rating = freezed,
    Object? dateTime = freezed,
  }) {
    return _then(_value.copyWith(
      clientUid: freezed == clientUid
          ? _value.clientUid
          : clientUid // ignore: cast_nullable_to_non_nullable
              as String?,
      clientName: freezed == clientName
          ? _value.clientName
          : clientName // ignore: cast_nullable_to_non_nullable
              as String?,
      clientPicture: freezed == clientPicture
          ? _value.clientPicture
          : clientPicture // ignore: cast_nullable_to_non_nullable
              as String?,
      review: freezed == review
          ? _value.review
          : review // ignore: cast_nullable_to_non_nullable
              as String?,
      rating: freezed == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as int?,
      dateTime: freezed == dateTime
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReviewImplCopyWith<$Res> implements $ReviewCopyWith<$Res> {
  factory _$$ReviewImplCopyWith(
          _$ReviewImpl value, $Res Function(_$ReviewImpl) then) =
      __$$ReviewImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? clientUid,
      String? clientName,
      String? clientPicture,
      String? review,
      int? rating,
      DateTime? dateTime});
}

/// @nodoc
class __$$ReviewImplCopyWithImpl<$Res>
    extends _$ReviewCopyWithImpl<$Res, _$ReviewImpl>
    implements _$$ReviewImplCopyWith<$Res> {
  __$$ReviewImplCopyWithImpl(
      _$ReviewImpl _value, $Res Function(_$ReviewImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? clientUid = freezed,
    Object? clientName = freezed,
    Object? clientPicture = freezed,
    Object? review = freezed,
    Object? rating = freezed,
    Object? dateTime = freezed,
  }) {
    return _then(_$ReviewImpl(
      clientUid: freezed == clientUid
          ? _value.clientUid
          : clientUid // ignore: cast_nullable_to_non_nullable
              as String?,
      clientName: freezed == clientName
          ? _value.clientName
          : clientName // ignore: cast_nullable_to_non_nullable
              as String?,
      clientPicture: freezed == clientPicture
          ? _value.clientPicture
          : clientPicture // ignore: cast_nullable_to_non_nullable
              as String?,
      review: freezed == review
          ? _value.review
          : review // ignore: cast_nullable_to_non_nullable
              as String?,
      rating: freezed == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as int?,
      dateTime: freezed == dateTime
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

class _$ReviewImpl implements _Review {
  _$ReviewImpl(
      {this.clientUid,
      this.clientName,
      this.clientPicture,
      this.review,
      this.rating,
      this.dateTime});

  @override
  final String? clientUid;
  @override
  final String? clientName;
  @override
  final String? clientPicture;
  @override
  final String? review;
  @override
  final int? rating;
  @override
  final DateTime? dateTime;

  @override
  String toString() {
    return 'Review(clientUid: $clientUid, clientName: $clientName, clientPicture: $clientPicture, review: $review, rating: $rating, dateTime: $dateTime)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReviewImpl &&
            (identical(other.clientUid, clientUid) ||
                other.clientUid == clientUid) &&
            (identical(other.clientName, clientName) ||
                other.clientName == clientName) &&
            (identical(other.clientPicture, clientPicture) ||
                other.clientPicture == clientPicture) &&
            (identical(other.review, review) || other.review == review) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.dateTime, dateTime) ||
                other.dateTime == dateTime));
  }

  @override
  int get hashCode => Object.hash(runtimeType, clientUid, clientName,
      clientPicture, review, rating, dateTime);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReviewImplCopyWith<_$ReviewImpl> get copyWith =>
      __$$ReviewImplCopyWithImpl<_$ReviewImpl>(this, _$identity);
}

abstract class _Review implements Review {
  factory _Review(
      {final String? clientUid,
      final String? clientName,
      final String? clientPicture,
      final String? review,
      final int? rating,
      final DateTime? dateTime}) = _$ReviewImpl;

  @override
  String? get clientUid;
  @override
  String? get clientName;
  @override
  String? get clientPicture;
  @override
  String? get review;
  @override
  int? get rating;
  @override
  DateTime? get dateTime;
  @override
  @JsonKey(ignore: true)
  _$$ReviewImplCopyWith<_$ReviewImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
