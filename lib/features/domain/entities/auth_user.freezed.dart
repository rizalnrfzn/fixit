// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AuthUser {
  @HiveField(1)
  String? get uid => throw _privateConstructorUsedError;
  @HiveField(2)
  String? get name => throw _privateConstructorUsedError;
  @HiveField(3)
  String? get email => throw _privateConstructorUsedError;
  @HiveField(4)
  String? get phoneNumber => throw _privateConstructorUsedError;
  @HiveField(5)
  String? get profilePicture => throw _privateConstructorUsedError;
  @HiveField(6)
  String? get address => throw _privateConstructorUsedError;
  @HiveField(7)
  String? get location => throw _privateConstructorUsedError;
  @HiveField(8)
  bool? get isRegistered => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AuthUserCopyWith<AuthUser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthUserCopyWith<$Res> {
  factory $AuthUserCopyWith(AuthUser value, $Res Function(AuthUser) then) =
      _$AuthUserCopyWithImpl<$Res, AuthUser>;
  @useResult
  $Res call(
      {@HiveField(1) String? uid,
      @HiveField(2) String? name,
      @HiveField(3) String? email,
      @HiveField(4) String? phoneNumber,
      @HiveField(5) String? profilePicture,
      @HiveField(6) String? address,
      @HiveField(7) String? location,
      @HiveField(8) bool? isRegistered});
}

/// @nodoc
class _$AuthUserCopyWithImpl<$Res, $Val extends AuthUser>
    implements $AuthUserCopyWith<$Res> {
  _$AuthUserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = freezed,
    Object? name = freezed,
    Object? email = freezed,
    Object? phoneNumber = freezed,
    Object? profilePicture = freezed,
    Object? address = freezed,
    Object? location = freezed,
    Object? isRegistered = freezed,
  }) {
    return _then(_value.copyWith(
      uid: freezed == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      profilePicture: freezed == profilePicture
          ? _value.profilePicture
          : profilePicture // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      isRegistered: freezed == isRegistered
          ? _value.isRegistered
          : isRegistered // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AuthUserImplCopyWith<$Res>
    implements $AuthUserCopyWith<$Res> {
  factory _$$AuthUserImplCopyWith(
          _$AuthUserImpl value, $Res Function(_$AuthUserImpl) then) =
      __$$AuthUserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(1) String? uid,
      @HiveField(2) String? name,
      @HiveField(3) String? email,
      @HiveField(4) String? phoneNumber,
      @HiveField(5) String? profilePicture,
      @HiveField(6) String? address,
      @HiveField(7) String? location,
      @HiveField(8) bool? isRegistered});
}

/// @nodoc
class __$$AuthUserImplCopyWithImpl<$Res>
    extends _$AuthUserCopyWithImpl<$Res, _$AuthUserImpl>
    implements _$$AuthUserImplCopyWith<$Res> {
  __$$AuthUserImplCopyWithImpl(
      _$AuthUserImpl _value, $Res Function(_$AuthUserImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = freezed,
    Object? name = freezed,
    Object? email = freezed,
    Object? phoneNumber = freezed,
    Object? profilePicture = freezed,
    Object? address = freezed,
    Object? location = freezed,
    Object? isRegistered = freezed,
  }) {
    return _then(_$AuthUserImpl(
      uid: freezed == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      profilePicture: freezed == profilePicture
          ? _value.profilePicture
          : profilePicture // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      isRegistered: freezed == isRegistered
          ? _value.isRegistered
          : isRegistered // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc

@HiveType(typeId: 0)
class _$AuthUserImpl extends _AuthUser {
  _$AuthUserImpl(
      {@HiveField(1) this.uid,
      @HiveField(2) this.name,
      @HiveField(3) this.email,
      @HiveField(4) this.phoneNumber,
      @HiveField(5) this.profilePicture,
      @HiveField(6) this.address,
      @HiveField(7) this.location,
      @HiveField(8) this.isRegistered})
      : super._();

  @override
  @HiveField(1)
  final String? uid;
  @override
  @HiveField(2)
  final String? name;
  @override
  @HiveField(3)
  final String? email;
  @override
  @HiveField(4)
  final String? phoneNumber;
  @override
  @HiveField(5)
  final String? profilePicture;
  @override
  @HiveField(6)
  final String? address;
  @override
  @HiveField(7)
  final String? location;
  @override
  @HiveField(8)
  final bool? isRegistered;

  @override
  String toString() {
    return 'AuthUser(uid: $uid, name: $name, email: $email, phoneNumber: $phoneNumber, profilePicture: $profilePicture, address: $address, location: $location, isRegistered: $isRegistered)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthUserImpl &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.profilePicture, profilePicture) ||
                other.profilePicture == profilePicture) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.isRegistered, isRegistered) ||
                other.isRegistered == isRegistered));
  }

  @override
  int get hashCode => Object.hash(runtimeType, uid, name, email, phoneNumber,
      profilePicture, address, location, isRegistered);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthUserImplCopyWith<_$AuthUserImpl> get copyWith =>
      __$$AuthUserImplCopyWithImpl<_$AuthUserImpl>(this, _$identity);
}

abstract class _AuthUser extends AuthUser {
  factory _AuthUser(
      {@HiveField(1) final String? uid,
      @HiveField(2) final String? name,
      @HiveField(3) final String? email,
      @HiveField(4) final String? phoneNumber,
      @HiveField(5) final String? profilePicture,
      @HiveField(6) final String? address,
      @HiveField(7) final String? location,
      @HiveField(8) final bool? isRegistered}) = _$AuthUserImpl;
  _AuthUser._() : super._();

  @override
  @HiveField(1)
  String? get uid;
  @override
  @HiveField(2)
  String? get name;
  @override
  @HiveField(3)
  String? get email;
  @override
  @HiveField(4)
  String? get phoneNumber;
  @override
  @HiveField(5)
  String? get profilePicture;
  @override
  @HiveField(6)
  String? get address;
  @override
  @HiveField(7)
  String? get location;
  @override
  @HiveField(8)
  bool? get isRegistered;
  @override
  @JsonKey(ignore: true)
  _$$AuthUserImplCopyWith<_$AuthUserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
