import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fixit/features/features.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_user_model.freezed.dart';
part 'auth_user_model.g.dart';

@freezed
class AuthUserModel with _$AuthUserModel {
  factory AuthUserModel({
    String? uid,
    String? name,
    String? email,
    String? phoneNumber,
    String? profilePicture,
    String? address,
    String? location,
    bool? isRegistered,
  }) = _AuthUserModel;

  AuthUserModel._();

  factory AuthUserModel.fromJson(Map<String, dynamic> json) =>
      _$AuthUserModelFromJson(json);

  AuthUser toEntity() => AuthUser(
        uid: uid,
        name: name,
        email: email,
        phoneNumber: phoneNumber,
        profilePicture: profilePicture,
        address: address,
        location: location,
        isRegistered: isRegistered,
      );

  factory AuthUserModel.fromFirestore(
          DocumentSnapshot snapshot, SnapshotOptions? options) =>
      AuthUserModel.fromJson(snapshot.data() as Map<String, dynamic>);

  static Map<String, dynamic> toFirestore(
          AuthUserModel authUserModel, SetOptions? options) =>
      authUserModel.toJson();
}
