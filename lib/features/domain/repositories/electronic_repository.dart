import 'package:fixit/features/features.dart';

abstract class ElectronicRepository {
  Stream<List<Electronic>> streamElectronics();
}
