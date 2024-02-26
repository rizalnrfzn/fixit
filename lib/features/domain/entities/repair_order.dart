import 'package:fixit/features/features.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:latlong2/latlong.dart';

part 'repair_order.freezed.dart';

@freezed
class RepairOrder with _$RepairOrder {
  factory RepairOrder({
    String? id,
    String? clientUid,
    String? technicianUid,
    LatLng? clientLocation,
    LatLng? technicianLocation,
    String? clientAddress,
    double? duration,
    double? distance,
    String? electronic,
    List<String>? gripe,
    List<String>? damage,
    List<String>? electronicPicture,
    int? checkingCost,
    int? repairCost,
    int? totalCost,
    DateTime? dateTime,
    String? status,
    bool? repair,
    bool? pay,
    bool? canceled,
    String? reasonCancelled,
    Direction? direction,
  }) = _RepairOrder;

  RepairOrder._();

  RepairOrderModel toModel() => RepairOrderModel(
        id: id,
        clientUid: clientUid,
        technicianUid: technicianUid,
        clientLocation: clientLocation,
        technicianLocation: technicianLocation,
        clientAddress: clientAddress,
        duration: duration,
        distance: distance,
        electronic: electronic,
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
        canceled: canceled,
        reasonCancelled: reasonCancelled,
      );
}
