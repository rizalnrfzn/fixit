import 'package:fixit/features/features.dart';

abstract class TechnicianRepository {
  Stream<List<Technician>> streamTechnicians();

  Stream<List<Review>> streamReviews(String uid);
}
