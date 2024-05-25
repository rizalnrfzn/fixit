import 'package:fixit/features/features.dart';

class ElectronicRepositoryImpl implements ElectronicRepository {
  final ElectronicRemoteDatasource electronicRemoteDatasource;

  ElectronicRepositoryImpl(this.electronicRemoteDatasource);

  @override
  Stream<List<Electronic>> streamElectronics() async* {
    try {
      yield* electronicRemoteDatasource.streamElectronics().map(
            (event) => event
                .map(
                  (e) => e.toEntity(),
                )
                .toList(),
          );
    } catch (e) {
      yield* Stream.error(e);
    }
  }
}
