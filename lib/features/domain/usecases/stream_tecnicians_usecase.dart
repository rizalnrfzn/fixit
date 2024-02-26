import 'package:fixit/features/features.dart';

class StreamTechniciansUsecase {
  final TechnicianRepository _repository;

  StreamTechniciansUsecase(this._repository);

  Stream<List<Technician>> call() => _repository.streamTechnicians();
}
