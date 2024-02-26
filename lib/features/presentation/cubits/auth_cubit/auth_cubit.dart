import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/core.dart';
import '../../../../../utils/utils.dart';
import '../../../features.dart';

part 'auth_cubit.freezed.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(
    this._postLogin,
    this._streamUser,
    this._postRegister,
    this._registerDataUsecase,
    this._editProfileUsecase,
  ) : super(const _Loading());

  final LoginUsecase _postLogin;
  final RegisterUsecase _postRegister;
  final RegisterDataUsecase _registerDataUsecase;
  final EditProfileUsecase _editProfileUsecase;

  final StreamAuthUserUsecase _streamUser;

  StreamSubscription? _authUserSubscription;
  AuthUser? authUser;

  // void coba() async {
  //   final collRef = FirebaseFirestore.instance
  //       .collection('order')
  //       .withConverter(
  //           fromFirestore: RepairOrderModel.fromFirestore,
  //           toFirestore: RepairOrderModel.toFirestore);

  //   final data = await collRef.add(RepairOrderModel(
  //     id: 'aksdfas',
  //     clientUid: 'asdhfjkas',
  //     technicianUid: 'laksdhflas',
  //     clientLocation: const LatLng(-7.4453228, 109.2662425),
  //     technicianLocation: const LatLng(-7.4048233479, 109.362945327),
  //     route: [],
  //     clientAddress: 'asdjfaks',
  //     duration: 927384,
  //     distance: 39483,
  //     electronic: 'Televisi',
  //     gripe: ['keluhan televisi 1'],
  //     damage: [],
  //     electronicPicture: [],
  //     checkingCost: 5000,
  //     repairCost: 50000,
  //     totalCost: 55000,
  //     dateTime: DateTime.now(),
  //     status: 'online',
  //     repair: false,
  //     pay: false,
  //     canceled: false,
  //   ));

  //   print(data);
  // }

  // void coba() async {
  //   final collRef = FirebaseFirestore.instance
  //       .collection('technician')
  //       .withConverter(
  //           fromFirestore: TechnicianModel.fromFirestore,
  //           toFirestore: TechnicianModel.toFirestore);

  //   final data = await collRef.add(
  //     TechnicianModel(
  //       address: 'mewek',
  //       description: 'ini deskripsi',
  //       currentLocation: const LatLng(-7.4048233479, 109.362945327),
  //       location: const LatLng(-7.4048233479, 109.362945327),
  //       electronics: ['televisi', 'ac'],
  //       email: 'aksdjfakls@jgakfmal.dfj',
  //       images: ['ksdhfjasdhasf'],
  //       isOnline: true,
  //       inOrder: false,
  //       id: 'skdjflaksdf',
  //       isVerified: true,
  //       name: 'ckadkhfasjdfh',
  //       numberOfReviews: 0,
  //       phoneNumber: '08919027840312',
  //       profilePicture: 'kashdfahsdj',
  //       rating: 0,
  //     ),
  //   );
  //   print(data);
  // }

  void streamUser(String uid) {
    _authUserSubscription?.cancel();
    _authUserSubscription = _streamUser.call(uid).listen((event) {
      authUser = event;
      emit(_StreamUser(authUser));
      emit(_SuccessLogin(authUser));
    });
  }

  Future<void> login(LoginParams params) async {
    emit(const _Loading());
    final data = await _postLogin.call(params);

    data.fold(
      (l) {
        if (l is AuthFailure) {
          emit(_Failure(l.code));
        }
      },
      (r) {
        streamUser(r.uid!);
      },
    );
  }

  Future<void> register(RegisterParams params) async {
    emit(const _Loading());
    final data = await _postRegister.call(params);
    data.fold(
      (l) {
        if (l is AuthFailure) {
          emit(_Failure(l.code));
        }
      },
      (r) => emit(_SuccessRegister(r)),
    );
  }

  Future<void> registerData(RegisterDataParams params) async {
    emit(const _Loading());
    final data = await _registerDataUsecase.call(params);
    data.fold(
      (l) {
        if (l is AuthFailure) {
          emit(_Failure(l.code));
        }
      },
      (r) => emit(_SuccessRegisterData(r)),
    );
  }

  Future<void> editProfile(EditProfileParams params) async {
    emit(const _Loading());
    final data = await _editProfileUsecase.call(params);
    data.fold((l) {
      if (l is AuthFailure) {
        emit(_Failure(l.code));
      }
    }, (r) => emit(_SuccessEditProfile(r)));
  }

  Future<void> logout() async {
    emit(const _Loading());
    FirebaseAuth.instance.signOut();
    await MainBoxMixin().logoutBox();
    emit(const _LogedOut());
  }

  @override
  Future<void> close() {
    _authUserSubscription?.cancel();
    return super.close();
  }
}
