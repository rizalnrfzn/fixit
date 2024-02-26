import 'package:dartz/dartz.dart';
import 'package:fixit/core/core.dart';
import 'package:fixit/features/features.dart';

abstract class DirectionRemoteDatasource {
  Future<Either<Failure, DirectionModel>> getDirection(DirectionParams params);
}

class DirectionRemoteDatasourceImpl implements DirectionRemoteDatasource {
  final DioClient _client;

  DirectionRemoteDatasourceImpl(this._client);

  @override
  Future<Either<Failure, DirectionModel>> getDirection(
      DirectionParams params) async {
    final response = await _client.getRequest(
      '/directions/v5/mapbox/driving/${params.location?.longitude},${params.location?.latitude};${params.destinationLocation?.longitude},${params.destinationLocation?.latitude}?geometries=geojson&access_token=${ListAPI.mapBoxAccessToken}',
      converter: (response) =>
          DirectionModel.fromJson(response as Map<String, dynamic>),
    );

    return response;
  }
}
