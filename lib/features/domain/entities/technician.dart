import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:latlong2/latlong.dart';

import 'direction.dart';

part 'technician.freezed.dart';

@unfreezed
class Technician with _$Technician {
  factory Technician({
    String? uid,
    String? name,
    String? email,
    String? phoneNumber,
    String? description,
    String? profilePicture,
    List<String>? images,
    String? address,
    LatLng? location,
    LatLng? currentLocation,
    List<String>? electronics,
    bool? isVerified,
    bool? isOnline,
    bool? inOrder,
    double? rating,
    int? numberOfReviews,
    Direction? direction,
  }) = _Technician;
}
