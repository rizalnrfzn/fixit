import 'package:fixit/core/core.dart';
import 'package:fixit/features/features.dart';
import 'package:fixit/features/presentation/pages/order/order_step/cubit/post_review_cubit.dart';
import 'package:fixit/utils/utils.dart';
import 'package:get_it/get_it.dart';

GetIt sl = GetIt.instance;

Future<void> serviceLocator({
  bool isUnitTest = false,
  bool isHiveEnable = true,
  String prefixBox = '',
}) async {
  /// For unit testing only
  if (isUnitTest) {
    await sl.reset();
  }
  sl.registerSingleton<DioClient>(DioClient(isUnitTest: isUnitTest));
  _dataSources();
  _repositories();
  _useCase();
  _cubit();
  if (isHiveEnable) {
    await _initHiveBoxes(
      isUnitTest: isUnitTest,
      prefixBox: prefixBox,
    );
  }
}

Future<void> _initHiveBoxes({
  bool isUnitTest = false,
  String prefixBox = '',
}) async {
  await MainBoxMixin.initHive(prefixBox);
  sl.registerSingleton<MainBoxMixin>(MainBoxMixin());
}

/// Register repositories
void _repositories() {
  sl.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(sl(), sl()));

  sl.registerLazySingleton<DirectionRepository>(
      () => DirectionRepositoryImpl(sl()));

  sl.registerLazySingleton<ElectronicRepository>(
      () => ElectronicRepositoryImpl(sl()));

  sl.registerLazySingleton<GeolocationRepository>(
      () => GeolocationRepositoryImpl(sl()));

  sl.registerLazySingleton<RepairOrderRepository>(
      () => RepairOrderRepositoryImpl(sl()));

  sl.registerLazySingleton<TechnicianRepository>(
      () => TechnicianRepositoryImpl(sl()));

  sl.registerLazySingleton<ClientRepository>(() => ClientRepositoryImpl(sl()));

  sl.registerLazySingleton<ChatRepository>(() => ChatRepositoryImpl(sl()));

  sl.registerLazySingleton<BannerRepository>(() => BannerRepositoryImpl(sl()));
}

/// Register dataSources
void _dataSources() {
  sl.registerLazySingleton<AuthRemoteDatasource>(
      () => AuthRemoteDatasourceImpl());

  sl.registerLazySingleton<DirectionRemoteDatasource>(
      () => DirectionRemoteDatasourceImpl(sl()));

  sl.registerLazySingleton<ElectronicRemoteDatasource>(
      () => ElectronicRemoteDatasourceImpl());

  sl.registerLazySingleton<GeolocationRemoteDatasource>(
      () => GeolocationRemoteDatasourceImpl());

  sl.registerLazySingleton<RepairOrderRemoteDatasource>(
      () => RepairOrderRemoteDatasourceImpl());

  sl.registerLazySingleton<TechnicianRemoteDatasource>(
      () => TechniciansRemoteDatasourceImpl());

  sl.registerLazySingleton<ClientRemoteDatasource>(
      () => ClientRemoteDatasourceImpl());

  sl.registerLazySingleton<ChatRemoteDatasource>(
      () => ChatRemoteDatasourceImpl());

  sl.registerLazySingleton<BannerRemoteDatasource>(
      () => BannerRemoteDatasourceImpl());
}

void _useCase() {
  /// Auth
  sl.registerLazySingleton(() => LoginUsecase(sl()));
  sl.registerLazySingleton(() => StreamAuthUserUsecase(sl()));
  sl.registerLazySingleton(() => RegisterUsecase(sl()));
  sl.registerLazySingleton(() => RegisterDataUsecase(sl()));
  sl.registerLazySingleton(() => EditProfileUsecase(sl()));

  /// technician
  sl.registerLazySingleton(() => StreamTechniciansUsecase(sl()));
  sl.registerLazySingleton(() => GetDirectionUsecase(sl()));
  sl.registerLazySingleton(() => StreamReviewsUsecase(sl()));

  // order
  sl.registerLazySingleton(() => StreamRepairOrdersUsecase(sl()));
  sl.registerLazySingleton(() => PostOrderUsecase(sl()));
  sl.registerLazySingleton(() => AcceptRepairOrderUsecase(sl()));
  sl.registerLazySingleton(() => RejectRepairOrderUsecase(sl()));
  sl.registerLazySingleton(() => PaymentOrderUsecase(sl()));
  sl.registerLazySingleton(() => PostReviewUsecase(sl()));
  sl.registerLazySingleton(() => CancelOrderUsecase(sl()));

  // electronic
  sl.registerLazySingleton(() => StreamElectronicsUsecase(sl()));

  // client
  sl.registerLazySingleton(() => GetClientUsecase(sl()));

  // location
  sl.registerLazySingleton(() => GetLocationUsecase(sl()));
  sl.registerLazySingleton(() => ChangeLocationUsecase(sl()));

  // chat
  sl.registerLazySingleton(() => StreamChatListUsecase(sl()));
  sl.registerLazySingleton(() => GetChatUsecase(sl()));
  sl.registerLazySingleton(() => StreamChatUsecase(sl()));
  sl.registerLazySingleton(() => PostChatUsecase(sl()));
  sl.registerLazySingleton(() => NewChatUsecase(sl()));
  sl.registerLazySingleton(() => ReadChatUsecase(sl()));

  sl.registerLazySingleton(() => GetAllBannerUsecase(sl()));
}

void _cubit() {
  // cubit
  sl.registerFactory(() => AuthCubit(sl(), sl(), sl(), sl(), sl()));
  sl.registerFactory(() => ElectronicCubit(sl()));
  sl.registerFactory(() => TechnicianCubit(sl(), sl(), sl()));
  sl.registerFactory(() => OrderCubit(sl(), sl(), sl(), sl(), sl(), sl()));
  sl.registerFactory(() => LocationCubit(sl(), sl(), sl()));
  sl.registerFactory(() => ChatCubit(sl(), sl(), sl(), sl(), sl()));

  /// general pages
  sl.registerFactory(() => SettingsCubit());
  sl.registerFactory(() => MainCubit());

  /// profile
  sl.registerFactory(() => EditProfileCubit());

  /// Auth pages
  sl.registerFactory(() => LoginCubit());
  sl.registerFactory(() => RegisterCubit());
  sl.registerFactory(() => RegisterDataCubit());

  // technician
  sl.registerFactory(() => TechnicianDetailCubit(sl(), sl()));
  sl.registerFactory(() => MakeOrderCubit(sl(), sl()));

  // order
  sl.registerFactory(() => OrderSummaryCubit(sl()));
  sl.registerFactory(() => OrderDetailCubit(sl()));
  sl.registerFactory(() => OrderTileCubit(sl()));
  sl.registerFactory(() => PostReviewCubit());

  sl.registerFactory(() => BannerCubit(sl()));
}
