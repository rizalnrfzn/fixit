// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'technician_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TechnicianState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(String message) failure,
    required TResult Function(
            List<Technician> technicians, Geolocation geolocation)
        streamTechnicians,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(String message)? failure,
    TResult? Function(List<Technician> technicians, Geolocation geolocation)?
        streamTechnicians,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(String message)? failure,
    TResult Function(List<Technician> technicians, Geolocation geolocation)?
        streamTechnicians,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Failure value) failure,
    required TResult Function(_StreamTechnicians value) streamTechnicians,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Failure value)? failure,
    TResult? Function(_StreamTechnicians value)? streamTechnicians,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Failure value)? failure,
    TResult Function(_StreamTechnicians value)? streamTechnicians,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TechnicianStateCopyWith<$Res> {
  factory $TechnicianStateCopyWith(
          TechnicianState value, $Res Function(TechnicianState) then) =
      _$TechnicianStateCopyWithImpl<$Res, TechnicianState>;
}

/// @nodoc
class _$TechnicianStateCopyWithImpl<$Res, $Val extends TechnicianState>
    implements $TechnicianStateCopyWith<$Res> {
  _$TechnicianStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$TechnicianStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'TechnicianState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(String message) failure,
    required TResult Function(
            List<Technician> technicians, Geolocation geolocation)
        streamTechnicians,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(String message)? failure,
    TResult? Function(List<Technician> technicians, Geolocation geolocation)?
        streamTechnicians,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(String message)? failure,
    TResult Function(List<Technician> technicians, Geolocation geolocation)?
        streamTechnicians,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Failure value) failure,
    required TResult Function(_StreamTechnicians value) streamTechnicians,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Failure value)? failure,
    TResult? Function(_StreamTechnicians value)? streamTechnicians,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Failure value)? failure,
    TResult Function(_StreamTechnicians value)? streamTechnicians,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements TechnicianState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$FailureImplCopyWith<$Res> {
  factory _$$FailureImplCopyWith(
          _$FailureImpl value, $Res Function(_$FailureImpl) then) =
      __$$FailureImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$FailureImplCopyWithImpl<$Res>
    extends _$TechnicianStateCopyWithImpl<$Res, _$FailureImpl>
    implements _$$FailureImplCopyWith<$Res> {
  __$$FailureImplCopyWithImpl(
      _$FailureImpl _value, $Res Function(_$FailureImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$FailureImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$FailureImpl implements _Failure {
  const _$FailureImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'TechnicianState.failure(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FailureImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FailureImplCopyWith<_$FailureImpl> get copyWith =>
      __$$FailureImplCopyWithImpl<_$FailureImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(String message) failure,
    required TResult Function(
            List<Technician> technicians, Geolocation geolocation)
        streamTechnicians,
  }) {
    return failure(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(String message)? failure,
    TResult? Function(List<Technician> technicians, Geolocation geolocation)?
        streamTechnicians,
  }) {
    return failure?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(String message)? failure,
    TResult Function(List<Technician> technicians, Geolocation geolocation)?
        streamTechnicians,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Failure value) failure,
    required TResult Function(_StreamTechnicians value) streamTechnicians,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Failure value)? failure,
    TResult? Function(_StreamTechnicians value)? streamTechnicians,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Failure value)? failure,
    TResult Function(_StreamTechnicians value)? streamTechnicians,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class _Failure implements TechnicianState {
  const factory _Failure(final String message) = _$FailureImpl;

  String get message;
  @JsonKey(ignore: true)
  _$$FailureImplCopyWith<_$FailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$StreamTechniciansImplCopyWith<$Res> {
  factory _$$StreamTechniciansImplCopyWith(_$StreamTechniciansImpl value,
          $Res Function(_$StreamTechniciansImpl) then) =
      __$$StreamTechniciansImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Technician> technicians, Geolocation geolocation});

  $GeolocationCopyWith<$Res> get geolocation;
}

/// @nodoc
class __$$StreamTechniciansImplCopyWithImpl<$Res>
    extends _$TechnicianStateCopyWithImpl<$Res, _$StreamTechniciansImpl>
    implements _$$StreamTechniciansImplCopyWith<$Res> {
  __$$StreamTechniciansImplCopyWithImpl(_$StreamTechniciansImpl _value,
      $Res Function(_$StreamTechniciansImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? technicians = null,
    Object? geolocation = null,
  }) {
    return _then(_$StreamTechniciansImpl(
      null == technicians
          ? _value._technicians
          : technicians // ignore: cast_nullable_to_non_nullable
              as List<Technician>,
      null == geolocation
          ? _value.geolocation
          : geolocation // ignore: cast_nullable_to_non_nullable
              as Geolocation,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $GeolocationCopyWith<$Res> get geolocation {
    return $GeolocationCopyWith<$Res>(_value.geolocation, (value) {
      return _then(_value.copyWith(geolocation: value));
    });
  }
}

/// @nodoc

class _$StreamTechniciansImpl implements _StreamTechnicians {
  const _$StreamTechniciansImpl(
      final List<Technician> technicians, this.geolocation)
      : _technicians = technicians;

  final List<Technician> _technicians;
  @override
  List<Technician> get technicians {
    if (_technicians is EqualUnmodifiableListView) return _technicians;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_technicians);
  }

  @override
  final Geolocation geolocation;

  @override
  String toString() {
    return 'TechnicianState.streamTechnicians(technicians: $technicians, geolocation: $geolocation)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StreamTechniciansImpl &&
            const DeepCollectionEquality()
                .equals(other._technicians, _technicians) &&
            (identical(other.geolocation, geolocation) ||
                other.geolocation == geolocation));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_technicians), geolocation);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StreamTechniciansImplCopyWith<_$StreamTechniciansImpl> get copyWith =>
      __$$StreamTechniciansImplCopyWithImpl<_$StreamTechniciansImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(String message) failure,
    required TResult Function(
            List<Technician> technicians, Geolocation geolocation)
        streamTechnicians,
  }) {
    return streamTechnicians(technicians, geolocation);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(String message)? failure,
    TResult? Function(List<Technician> technicians, Geolocation geolocation)?
        streamTechnicians,
  }) {
    return streamTechnicians?.call(technicians, geolocation);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(String message)? failure,
    TResult Function(List<Technician> technicians, Geolocation geolocation)?
        streamTechnicians,
    required TResult orElse(),
  }) {
    if (streamTechnicians != null) {
      return streamTechnicians(technicians, geolocation);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Failure value) failure,
    required TResult Function(_StreamTechnicians value) streamTechnicians,
  }) {
    return streamTechnicians(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Failure value)? failure,
    TResult? Function(_StreamTechnicians value)? streamTechnicians,
  }) {
    return streamTechnicians?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Failure value)? failure,
    TResult Function(_StreamTechnicians value)? streamTechnicians,
    required TResult orElse(),
  }) {
    if (streamTechnicians != null) {
      return streamTechnicians(this);
    }
    return orElse();
  }
}

abstract class _StreamTechnicians implements TechnicianState {
  const factory _StreamTechnicians(
          final List<Technician> technicians, final Geolocation geolocation) =
      _$StreamTechniciansImpl;

  List<Technician> get technicians;
  Geolocation get geolocation;
  @JsonKey(ignore: true)
  _$$StreamTechniciansImplCopyWith<_$StreamTechniciansImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
