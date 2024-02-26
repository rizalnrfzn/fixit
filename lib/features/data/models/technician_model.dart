import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fixit/features/features.dart';
import 'package:fixit/utils/utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:latlong2/latlong.dart';

part 'technician_model.freezed.dart';
part 'technician_model.g.dart';

@unfreezed
class TechnicianModel with _$TechnicianModel {
  factory TechnicianModel({
    String? uid,
    String? name,
    String? email,
    String? phoneNumber,
    String? description,
    String? profilePicture,
    List<String>? images,
    String? address,
    @LatLngConverter() LatLng? location,
    @LatLngConverter() LatLng? currentLocation,
    List<String>? electronics,
    bool? isVerified,
    bool? isOnline,
    bool? inOrder,
    double? rating,
    int? numberOfReviews,
  }) = _TechnicianModel;

  TechnicianModel._();

  factory TechnicianModel.fromJson(Map<String, dynamic> json) =>
      _$TechnicianModelFromJson(json);

  factory TechnicianModel.fromFirestore(
          DocumentSnapshot snapshot, SnapshotOptions? options) =>
      TechnicianModel.fromJson(snapshot.data() as Map<String, dynamic>);

  static Map<String, dynamic> toFirestore(
          TechnicianModel object, SetOptions? options) =>
      object.toJson();

  Technician toEntity() => Technician(
        uid: uid,
        name: name,
        email: email,
        phoneNumber: phoneNumber,
        description: description,
        profilePicture: profilePicture,
        images: images,
        address: address,
        location: location,
        currentLocation: currentLocation,
        electronics: electronics,
        isVerified: isVerified,
        isOnline: isOnline,
        inOrder: inOrder,
        rating: rating,
        numberOfReviews: numberOfReviews,
      );
}
