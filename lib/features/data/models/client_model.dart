import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fixit/features/features.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'client_model.freezed.dart';
part 'client_model.g.dart';

@freezed
class ClientModel with _$ClientModel {
  factory ClientModel({
    String? uid,
    String? name,
    String? profilePicture,
  }) = _ClientModel;

  ClientModel._();

  factory ClientModel.fromJson(Map<String, dynamic> json) =>
      _$ClientModelFromJson(json);

  Client toEntity() => Client(
        uid: uid,
        name: name,
        profilePicture: profilePicture,
      );

  factory ClientModel.fromFirestore(
          DocumentSnapshot snapshot, SnapshotOptions? options) =>
      ClientModel.fromJson(snapshot.data() as Map<String, dynamic>);

  static Map<String, dynamic> toFirestore(
          ClientModel electronicModel, SetOptions? options) =>
      electronicModel.toJson();
}
