import 'package:fixit/features/features.dart';
import 'package:fixit/core/di/injector.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late AuthRemoteDatasourceImpl dataSource;

  setUp(() async {
    TestWidgetsFlutterBinding.ensureInitialized();

    await serviceLocator(
      isUnitTest: true,
      prefixBox: 'auth_remote_datasource_test_',
    );
    dataSource = AuthRemoteDatasourceImpl();
  });
}
