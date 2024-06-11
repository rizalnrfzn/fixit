import 'package:dartz/dartz.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

import '../../../core/core.dart';
import '../../features.dart';

abstract class AuthRemoteDatasource {
  Future<Either<Failure, AuthUserModel>> login(LoginParams params);

  Future<Either<Failure, AuthUserModel>> register(RegisterParams params);

  Future<Either<Failure, AuthUserModel>> registerData(
      RegisterDataParams params);

  Future<Either<Failure, AuthUserModel>> editProfile(EditProfileParams params);

  Stream<AuthUserModel> streamAuthUser(String uid);
}

class AuthRemoteDatasourceImpl implements AuthRemoteDatasource {
  final _auth = FirebaseAuth.instance;
  final _storage = FirebaseStorage.instance.ref('client');

  final _collRef = FirebaseFirestore.instance
      .collection('client')
      .withConverter<AuthUserModel>(
          fromFirestore: AuthUserModel.fromFirestore,
          toFirestore: AuthUserModel.toFirestore);

  @override
  Future<Either<Failure, AuthUserModel>> login(LoginParams params) async {
    try {
      final account = await _auth.signInWithEmailAndPassword(
        email: params.email,
        password: params.password,
      );

      final accountData = await _collRef.doc(account.user!.uid).get();

      if (!(accountData.exists)) {
        return Left(AuthFailure('Akun tidak terdaftar sebagai pengguna'));
      }

      return Right(accountData.data()!);
    } on FirebaseException catch (e) {
      return Left(AuthFailure(e.code));
    }
  }

  @override
  Future<Either<Failure, AuthUserModel>> registerData(
      RegisterDataParams params) async {
    try {
      final account = _auth.currentUser!;
      final imageRef = _storage.child('${account.uid}/profilePicture.png');
      String profilePicture;

      if (params.profilePicture != null) {
        await imageRef.putFile(params.profilePicture!);
        profilePicture = await imageRef.getDownloadURL();
      } else {
        profilePicture =
            'https://firebasestorage.googleapis.com/v0/b/fixit-1c96e.appspot.com/o/No-Profile-Picture.png?alt=media&token=c7acd718-ad64-4b17-9274-e8996a32268e';
      }

      final data = AuthUserModel(
        uid: account.uid,
        email: account.email,
        name: params.name,
        phoneNumber: params.phoneNumber,
        profilePicture: profilePicture,
        isRegistered: true,
      );

      await _collRef.doc(account.uid).update(data.toJson());

      return Right(data);
    } on FirebaseException catch (e) {
      return Left(AuthFailure(e.code));
    }
  }

  @override
  Future<Either<Failure, AuthUserModel>> editProfile(
      EditProfileParams params) async {
    try {
      final account = _auth.currentUser!;
      final imageRef = _storage.child('${account.uid}/profilePicture.png');
      String profilePicture;

      if (params.newProfilePicture != null) {
        await imageRef.putFile(params.newProfilePicture!);
        profilePicture = await imageRef.getDownloadURL();
      } else {
        profilePicture = params.profilePicture;
      }

      final data = AuthUserModel(
        uid: account.uid,
        email: account.email,
        name: params.name,
        phoneNumber: params.phoneNumber,
        profilePicture: profilePicture,
        isRegistered: true,
      );

      await _collRef.doc(account.uid).update(data.toJson());

      return Right(data);
    } on FirebaseException catch (e) {
      return Left(AuthFailure(e.code));
    }
  }

  @override
  Future<Either<Failure, AuthUserModel>> register(RegisterParams params) async {
    try {
      final account = await _auth.createUserWithEmailAndPassword(
        email: params.email,
        password: params.password,
      );

      final data = AuthUserModel(
        uid: account.user!.uid,
        email: params.email,
        isRegistered: false,
        profilePicture:
            'https://firebasestorage.googleapis.com/v0/b/fixit-1c96e.appspot.com/o/no-profile-picture.png?alt=media&token=4704d7ed-e468-4cfd-9ffa-ef04b1efdf54',
      );

      await _collRef.doc(account.user!.uid).set(data);

      return Right(data);
    } on FirebaseException catch (e) {
      return Left(AuthFailure(e.code));
    }
  }

  @override
  Stream<AuthUserModel> streamAuthUser(String uid) async* {
    try {
      yield* _collRef.doc(uid).snapshots().map((event) {
        if (event.exists) {
          return event.data()!;
        } else {
          throw 'User not Found';
        }
      });
    } catch (e) {
      yield* Stream<AuthUserModel>.error(e);
    }
  }
}
