import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oktoast/oktoast.dart';

import 'core/core.dart';
import 'features/features.dart';
import 'utils/utils.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
    );

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => sl<SettingsCubit>()..getActiveTheme()),
        BlocProvider(create: (_) {
          if (MainBoxMixin.mainBox?.get(MainBoxKeys.authUserId.name) != null) {
            return sl<AuthCubit>()
              ..streamUser(
                  MainBoxMixin.mainBox?.get(MainBoxKeys.authUserId.name));
          } else {
            return sl<AuthCubit>();
          }
        }),
        BlocProvider(
          create: (context) => sl<TechnicianCubit>(),
        ),
        BlocProvider(
          create: (context) => sl<ElectronicCubit>(),
        ),
        BlocProvider(
          create: (context) => sl<OrderCubit>(),
        ),
        BlocProvider(
          create: (context) => sl<LocationCubit>(),
        ),
        BlocProvider(
          create: (context) => sl<ChatCubit>(),
        ),
      ],
      child: OKToast(
        child: ScreenUtilInit(
          /// Set screen size to make responsive
          /// Almost all device

          designSize: const Size(428, 926),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, __) {
            /// Pass context to appRoute
            AppRoute.setStream(context);

            return BlocBuilder<SettingsCubit, DataHelper>(
              builder: (_, data) => MaterialApp.router(
                routerConfig: AppRoute.router,
                localizationsDelegates: const [
                  Strings.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                debugShowCheckedModeBanner: false,
                builder: (BuildContext context, Widget? child) {
                  final MediaQueryData data = MediaQuery.of(context);

                  return MediaQuery(
                    data: data.copyWith(
                      alwaysUse24HourFormat: true,
                      textScaler: const TextScaler.linear(1),
                    ),
                    child: child!,
                  );
                },
                title: Constants.get.appName,
                theme: themeLight(context),
                darkTheme: themeDark(context),
                locale: Locale(data.type ?? "en"),
                supportedLocales: L10n.all,
                themeMode: data.activeTheme.mode,
              ),
            );
          },
        ),
      ),
    );
  }
}
