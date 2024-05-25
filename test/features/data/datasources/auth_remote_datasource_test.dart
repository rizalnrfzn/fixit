import 'dart:convert';

import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
import 'package:fixit/features/features.dart';
import 'package:fixit/core/di/injector.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../helpers/json_reader.dart';
import '../../../helpers/paths.dart';

void main() {
  late AuthRemoteDatasourceImpl dataSource;
  late MockFirebaseAuth auth;

  final mockUser = MockUser(
    isAnonymous: false,
    uid: 'yhlObRZToLQhfJoJzv1Aykcy7B93',
    email: 'levelsekawan@gmail.com',
  );

  setUp(() async {
    TestWidgetsFlutterBinding.ensureInitialized();

    await serviceLocator(
      isUnitTest: true,
      prefixBox: 'auth_remote_datasource_test_',
    );
    dataSource = AuthRemoteDatasourceImpl();
    auth = MockFirebaseAuth(mockUser: mockUser);
  });

  group('login', () {
    final loginParams =
        LoginParams(email: 'levelsekawan@gmail.com', password: 'coba1234');

    final authUser = AuthUserModel.fromJson(
      json.decode(jsonReader(loginSuccessResponsePath)) as Map<String, dynamic>,
    );

    test(
      'should return AuthUserModel when success',
      () async {
        final userCredential = await auth.signInWithEmailAndPassword(
          email: 'levelsekawan@gmail.com',
          password: 'coba1234',
        );

        final userId = userCredential.user!.uid;

        expect(userId, equals(authUser.uid));
      },
    );
  });
}
