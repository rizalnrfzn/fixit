import 'package:fixit/features/features.dart';

class TechnicianRepositoryImpl implements TechnicianRepository {
  final TechnicianRemoteDatasource _datasource;

  TechnicianRepositoryImpl(this._datasource);

  @override
  Stream<List<Review>> streamReviews(String uid) async* {
    try {
      yield* _datasource.streamReviews(uid).map(
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

  @override
  Stream<List<Technician>> streamTechnicians() async* {
    try {
      yield* _datasource.streamTechnicians().map(
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
