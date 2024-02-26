import 'package:fixit/features/features.dart';
import 'package:flutter/cupertino.dart';
import 'package:mockito/annotations.dart';

@GenerateMocks([
  AuthRepository,
  DirectionRepository,
  ElectronicRepository,
  GeolocationRepository,
  RepairOrderRepository,
  TechnicianRepository,
])
@GenerateNiceMocks([MockSpec<BuildContext>()])
void main() {}
