// import 'dart:async';

// import 'package:fixit/core/core.dart';
// import 'package:fixit/features/features.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:freezed_annotation/freezed_annotation.dart';
// import 'package:latlong2/latlong.dart';

// part 'technician_state.dart';
// part 'technician_cubit.freezed.dart';

// class TechnicianCubit extends Cubit<TechnicianState> {
//   TechnicianCubit(
//     this._streamTechnicians,
//     this._getLocation,
//     this._getDirection,
//   ) : super(const TechnicianState.loading());

//   final StreamTechniciansUsecase _streamTechnicians;
//   final GetLocationUsecase _getLocation;
//   final GetDirectionUsecase _getDirection;

//   StreamSubscription? _technicianSubscription;

//   Geolocation? geolocation;

//   Future<Geolocation?> getLocation() async {
//     final data = await _getLocation.call(NoParams());

//     data.fold(
//       (l) {
//         if (l is LocationError) {
//           emit(_Failure(l.code));
//         }
//       },
//       (r) {
//         geolocation = r;
//         return r;
//       },
//     );
//     return null;
//   }

//   // Future<Direction?> getDirection({
//   //   required LatLng location,
//   //   required LatLng destinationLocation,
//   // }) async {
//   //   final data = await _getDirection.call(
//   //     DirectionParams(location, destinationLocation),
//   //   );

//   //   return data.fold(
//   //     (l) {
//   //       if (l is ServerFailure) {
//   //         emit(_Failure(l.message!));
//   //       }
//   //       return null;
//   //     },
//   //     (r) {
//   //       return r;
//   //     },
//   //   );
//   // }
//   Future<Direction?> getDirection({
//     required LatLng location,
//     required LatLng destinationLocation,
//   }) async {
//     final data = await _getDirection.call(
//       DirectionParams(location, destinationLocation),
//     );

//     return data.fold(
//       (l) {
//         if (l is ServerFailure) {
//           emit(_Failure(l.message!));
//         }
//         return null;
//       },
//       (r) {
//         return r;
//       },
//     );
//   }

//   void streamTechnicians() async {
//     emit(const _Loading());
//     await getLocation();
//     List<Technician> technicians = [];
//     _technicianSubscription?.cancel();
//     _technicianSubscription = _streamTechnicians.call().listen(
//       (event) async {
//         final techniciansNew = technicians;
//         for (var model in event) {
//           if (techniciansNew.any((element) => element.id == model.id)) {
//             print('jalan jika data isi');
//             final oldData =
//                 techniciansNew.firstWhere((element) => element.id == model.id);
//             final newData = model;
//             if (oldData.direction == null) {
//               print('jalan jika direction null');
//               final direction = await getDirection(
//                   location: geolocation!.location!,
//                   destinationLocation: model.location!);

//               techniciansNew[techniciansNew
//                       .indexWhere((element) => element.id == model.id)] =
//                   newData.copyWith(direction: direction);
//             } else {
//               print('jalan jika direction isi');
//               techniciansNew[techniciansNew
//                       .indexWhere((element) => element.id == model.id)] =
//                   newData.copyWith(direction: oldData.direction);
//             }
//           } else {
//             print('jalan jika data kosong');
//             final direction = await getDirection(
//                 location: geolocation!.location!,
//                 destinationLocation: model.location!);

//             techniciansNew.add(model.copyWith(direction: direction));
//           }
//         }
//         print('jalan ${techniciansNew[0].isOnline}');
//         print('jalan emit');
//         print('jalan $techniciansNew');
//         if (technicians == techniciansNew) {
//           emit(_StreamTechnicians(technicians, geolocation!));
//         } else {
//           technicians = techniciansNew;
//           emit(_StreamTechnicians(techniciansNew, geolocation!));
//         }

//         // List<Technician> techniciansWithDirection = [];
//         // techniciansWithDirection = technicians;
//         // for (var technician in event) {
//         //   if (!(techniciansWithDirection
//         //       .any((element) => element.id == technician.id))) {
//         //     if (technician.direction == null) {
//         //       final direction = await getDirection(
//         //           location: geolocation!.location!,
//         //           destinationLocation: technician.location!);

//         //       techniciansWithDirection
//         //           .add(technician.copyWith(direction: direction));
//         //     } else {
//         //       techniciansWithDirection.add(technician);
//         //     }
//         //   } else {
//         //     if (techniciansWithDirection
//         //             .firstWhere((element) => element.id == technician.id)
//         //             .direction ==
//         //         null) {
//         //       final direction = await getDirection(
//         //           location: geolocation!.location!,
//         //           destinationLocation: technician.location!);

//         //       techniciansWithDirection
//         //           .firstWhere((element) => element.id == technician.id)
//         //           .direction = direction;
//         //     } else {
//         //       techniciansWithDirection[techniciansWithDirection
//         //               .indexWhere((element) => element.id == technician.id)] =
//         //           technician.copyWith(
//         //         direction: techniciansWithDirection
//         //             .firstWhere((element) => element.id == technician.id)
//         //             .direction,
//         //       );
//         //     }
//         //   }
//         // }
//         // technicians = techniciansWithDirection;
//         // emit(_StreamTechnicians(techniciansWithDirection, geolocation!));
//       },
//     );
//   }

//   Future<void> direction(
//     Geolocation? geolocation,
//     List<Technician> technicians,
//   ) async {
//     print('jalan juga');
//     List<Technician> technicianWithDirection = [];
//     for (var technician in technicians) {
//       if (technician.direction == null) {
//         final direction = await getDirection(
//           location: geolocation!.location!,
//           destinationLocation: technician.location!,
//         );
//         technicianWithDirection.add(technician.copyWith(direction: direction));
//       } else {
//         technicianWithDirection.add(technician);
//       }
//     }
//     emit(_StreamTechnicians(technicianWithDirection, geolocation!));
//   }

//   @override
//   Future<void> close() {
//     _technicianSubscription?.cancel();
//     return super.close();
//   }
// }
