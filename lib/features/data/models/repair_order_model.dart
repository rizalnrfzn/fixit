// ignore_for_file: invalid_annotation_target

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fixit/features/features.dart';
import 'package:fixit/utils/utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:latlong2/latlong.dart';

part 'repair_order_model.freezed.dart';
part 'repair_order_model.g.dart';

@freezed
class RepairOrderModel with _$RepairOrderModel {
  factory RepairOrderModel({
    String? id,
    String? clientUid,
    String? technicianUid,
    @LatLngConverter() LatLng? clientLocation,
    @LatLngConverter() LatLng? technicianLocation,
    String? clientAddress,
    double? duration,
    double? distance,
    String? electronicId,
    List<String>? gripe,
    List<String>? damage,
    List<String>? electronicPicture,
    int? checkingCost,
    int? repairCost,
    int? totalCost,
    @TimestampConverter() DateTime? dateTime,
    String? status,
    bool? repair,
    bool? pay,
    bool? cancelled,
    String? reasonCancelled,
  }) = _RepairOrderModel;

  const RepairOrderModel._();

  factory RepairOrderModel.fromJson(Map<String, dynamic> json) =>
      _$RepairOrderModelFromJson(json);

  factory RepairOrderModel.fromFirestore(
          DocumentSnapshot snapshot, SnapshotOptions? options) =>
      RepairOrderModel.fromJson(snapshot.data() as Map<String, dynamic>);

  static Map<String, dynamic> toFirestore(
          RepairOrderModel object, SetOptions? options) =>
      object.toJson();

  RepairOrder toEntity() => RepairOrder(
        id: id,
        clientUid: clientUid,
        technicianUid: technicianUid,
        clientLocation: clientLocation,
        technicianLocation: technicianLocation,
        clientAddress: clientAddress,
        duration: duration,
        distance: distance,
        electronicId: electronicId,
        gripe: gripe,
        damage: damage,
        electronicPicture: electronicPicture,
        checkingCost: checkingCost,
        repairCost: repairCost,
        totalCost: totalCost,
        dateTime: dateTime,
        status: status,
        repair: repair,
        pay: pay,
        cancelled: cancelled,
        reasonCancelled: reasonCancelled,
      );
}
