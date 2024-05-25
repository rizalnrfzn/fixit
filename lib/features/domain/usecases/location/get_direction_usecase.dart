import 'package:dartz/dartz.dart';
import 'package:fixit/core/core.dart';
import 'package:fixit/features/features.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:latlong2/latlong.dart';

part 'get_direction_usecase.freezed.dart';
part 'get_direction_usecase.g.dart';

class GetDirectionUsecase implements UseCase<Direction, DirectionParams> {
  final DirectionRepository _repository;

  GetDirectionUsecase(this._repository);

  @override
  Future<Either<Failure, Direction>> call(DirectionParams params) =>
      _repository.getDirection(params);
}

@freezed
class DirectionParams with _$DirectionParams {
  factory DirectionParams(
    LatLng? location,
    LatLng? destinationLocation,
  ) = _DirectionParams;

  factory DirectionParams.fromJson(Map<String, dynamic> json) =>
      _$DirectionParamsFromJson(json);
}
