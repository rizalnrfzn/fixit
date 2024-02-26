import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'auth_user.freezed.dart';
part 'auth_user.g.dart';

@freezed
class AuthUser extends HiveObject with _$AuthUser {
  @HiveType(typeId: 0)
  factory AuthUser({
    @HiveField(1) String? uid,
    @HiveField(2) String? name,
    @HiveField(3) String? email,
    @HiveField(4) String? phoneNumber,
    @HiveField(5) String? profilePicture,
    @HiveField(6) String? address,
    @HiveField(7) String? location,
    @HiveField(8) bool? isRegistered,
  }) = _AuthUser;

  AuthUser._();
}
