import 'package:dartz/dartz.dart';
import 'package:fixit/core/core.dart';
import 'package:fixit/features/features.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';

abstract class GeolocationRemoteDatasource {
  Future<Either<Failure, GeolocationModel>> getLocation();

  Future<Either<Failure, GeolocationModel>> changeLocation(
      ChangeLocationParams params);
}

class GeolocationRemoteDatasourceImpl implements GeolocationRemoteDatasource {
  @override
  Future<Either<Failure, GeolocationModel>> getLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    try {
      serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        await Geolocator.openLocationSettings().then((value) {
          if (!value) {
            return Future.error('Layanan lokasi dinonaktifkan');
          }
        });
      }

      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          return Future.error('Izin lokasi ditolak');
        }
      }

      if (permission == LocationPermission.deniedForever) {
        return Future.error(
            'Tidak dapat meminta izin lokasi karena izin lokasi ditolak secara permanen');
      }

      final location = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best,
      );

      if (location.isMocked) {
        return Left(LocationError('Fake location detected'));
      }

      final placemark =
          await placemarkFromCoordinates(location.latitude, location.longitude);

      return Right(
        GeolocationModel(
          location: LatLng(location.latitude, location.longitude),
          placemark: placemark[0],
        ),
      );
    } catch (e) {
      return Left(LocationError(e.toString()));
    }
  }

  @override
  Future<Either<Failure, GeolocationModel>> changeLocation(
      ChangeLocationParams params) async {
    try {
      final placemark = await placemarkFromCoordinates(
          params.location.latitude, params.location.longitude);

      return Right(GeolocationModel(
        location: params.location,
        placemark: placemark[0],
      ));
    } catch (e) {
      return Left(LocationError(e.toString()));
    }
  }
}
