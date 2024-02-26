import 'package:fixit/core/core.dart';
import 'package:fixit/features/features.dart';
import 'package:fixit/utils/utils.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

enum Routes {
  root("/"),

  /// General page
  splashScreen('/splashscreen'),
  onboard('/onboard'),
  dashboard('/dashboard'),
  specialOffers('/dashboard/special-offers'),
  allService('/dashboard/all-service'),
  notification('/notification'),

  // profile
  profile('/profile'),
  editProfile('/profile/edit'),
  settings('/settings'),

  // Auth Page
  login('/login'),
  register('/register'),
  registerData('/register/data'),

  // technician
  map('/map'),
  technicianList('/technician/list'),
  technicianDetail('/technician/detail'),
  review('/review'),
  makeOrder('/technician/make-order'),
  orderSummary('/technician/make-order/summary'),

  // order page
  order('/order'),
  orderDetail('/order/detail'),

  // chat
  chat('/chat'),
  roomChat('/chat/room'),
  ;

  const Routes(this.path);

  final String path;
}

final GlobalKey<NavigatorState> _rootNavigator =
    GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> _shellNavigator =
    GlobalKey<NavigatorState>(debugLabel: 'shell');

class AppRoute {
  static late BuildContext context;

  AppRoute.setStream(BuildContext ctx) {
    context = ctx;
  }

  static final GoRouter router = GoRouter(
    initialLocation: Routes.splashScreen.path,
    routerNeglect: true,
    debugLogDiagnostics: kDebugMode,
    refreshListenable: GoRouterRefreshStream(context.read<AuthCubit>().stream),
    redirect: (_, GoRouterState state) {
      final bool isAuthPage = state.matchedLocation == Routes.login.path ||
          state.matchedLocation == Routes.register.path ||
          state.matchedLocation == Routes.registerData.path;

      final bool isSplashScreen =
          state.matchedLocation == Routes.splashScreen.path;

      final bool isOnboardPage = state.matchedLocation == Routes.onboard.path;

      if (isSplashScreen) {
        return null;
      }

      if (isOnboardPage) {
        if ((MainBoxMixin.mainBox?.get(MainBoxKeys.isOnboardPassed.name)
                as bool?) ??
            false) {
          return isAuthPage ? null : Routes.login.path;
        } else {
          return null;
        }
      }

      if (!((MainBoxMixin.mainBox?.get(MainBoxKeys.isLogin.name) as bool?) ??
          false)) {
        return isAuthPage ? null : Routes.login.path;
      }

      if (isAuthPage &&
          ((MainBoxMixin.mainBox?.get(MainBoxKeys.isLogin.name) as bool?) ??
              false)) {
        if (MainBoxMixin.mainBox?.get(MainBoxKeys.isRegistered.name) as bool? ??
            false) {
          context.read<ElectronicCubit>().streamElectronics();
          context.read<TechnicianCubit>().streamTechnicians();
          context.read<OrderCubit>().streamOrders(
              MainBoxMixin.mainBox?.get(MainBoxKeys.authUserId.name));
          context.read<ChatCubit>().streamChatList(
              MainBoxMixin.mainBox?.get(MainBoxKeys.authUserId.name));

          return Routes.root.path;
        }
        return Routes.registerData.path;
      }

      return null;
    },
    navigatorKey: _rootNavigator,
    routes: [
      GoRoute(
        parentNavigatorKey: _rootNavigator,
        path: Routes.splashScreen.path,
        name: Routes.splashScreen.name,
        builder: (_, __) => const SplashScreenPage(),
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigator,
        path: Routes.onboard.path,
        name: Routes.onboard.name,
        builder: (_, __) => const OnboardPage(),
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigator,
        path: Routes.root.path,
        name: Routes.root.name,
        redirect: (_, __) => Routes.dashboard.path,
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigator,
        path: Routes.login.path,
        name: Routes.login.name,
        builder: (_, __) => BlocProvider(
          create: (_) => sl<LoginCubit>(),
          child: const LoginPage(),
        ),
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigator,
        path: Routes.register.path,
        name: Routes.register.name,
        builder: (_, __) => BlocProvider(
          create: (_) => sl<RegisterCubit>(),
          child: const RegisterPage(),
        ),
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigator,
        path: Routes.registerData.path,
        name: Routes.registerData.name,
        builder: (_, __) => BlocProvider(
          create: (_) => sl<RegisterDataCubit>(),
          child: const RegisterDataPage(),
        ),
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigator,
        path: Routes.notification.path,
        name: Routes.notification.name,
        builder: (_, __) => const NotificationPage(),
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigator,
        path: Routes.specialOffers.path,
        name: Routes.specialOffers.name,
        builder: (_, __) => const SpecialOffersPage(),
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigator,
        path: Routes.allService.path,
        name: Routes.allService.name,
        builder: (_, __) => const AllServicePage(),
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigator,
        path: Routes.settings.path,
        name: Routes.settings.name,
        builder: (_, __) => const SettingsPage(),
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigator,
        path: Routes.editProfile.path,
        name: Routes.editProfile.name,
        builder: (_, __) => BlocProvider(
          create: (_) => sl<EditProfileCubit>(),
          child: const EditProfilePage(),
        ),
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigator,
        path: Routes.technicianList.path,
        name: Routes.technicianList.name,
        builder: (_, state) {
          String? filter = state.extra as String?;
          return TechnicianListPage(filter: filter);
        },
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigator,
        path: Routes.technicianDetail.path,
        name: Routes.technicianDetail.name,
        builder: (_, state) {
          final String uid = state.extra as String;
          return BlocProvider.value(
            value: sl<TechnicianDetailCubit>()..streamReview(uid),
            child: TechnicianDetailPage(uid: uid),
          );
        },
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigator,
        path: Routes.review.path,
        name: Routes.review.name,
        builder: (_, state) {
          final String uid = state.extra as String;
          return BlocProvider.value(
            value: sl<TechnicianDetailCubit>()..streamReview(uid),
            child: const ReviewPage(),
          );
        },
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigator,
        path: Routes.makeOrder.path,
        name: Routes.makeOrder.name,
        builder: (_, state) {
          final String uid = state.extra as String;
          return BlocProvider(
            create: (context) => sl<MakeOrderCubit>(),
            child: MakeOrderPage(uid: uid),
          );
        },
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigator,
        path: Routes.orderSummary.path,
        name: Routes.orderSummary.name,
        builder: (_, state) {
          final list = state.extra as List<dynamic>;
          final order = list[0];
          final files = list[1];
          return BlocProvider.value(
            value: sl<OrderSummaryCubit>(),
            child: OrderSummaryPage(
              order: order,
              files: files,
            ),
          );
        },
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigator,
        path: Routes.orderDetail.path,
        name: Routes.orderDetail.name,
        builder: (_, state) {
          final String id = state.extra as String;
          return BlocProvider(
            create: (context) => sl<OrderDetailCubit>(),
            child: OrderDetailPage(orderId: id),
          );
        },
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigator,
        path: Routes.roomChat.path,
        name: Routes.roomChat.name,
        builder: (_, state) {
          final map = state.extra as Map<String, dynamic>;
          final chatListId = map['chatListId'];
          final technician = map['technician'];
          return RoomChatPage(
            chatListId: chatListId,
            technician: technician,
          );
        },
      ),
      ShellRoute(
        navigatorKey: _shellNavigator,
        builder: (_, __, child) => BlocProvider(
          create: (context) => sl<MainCubit>(),
          child: MainPage(child: child),
        ),
        routes: [
          GoRoute(
            parentNavigatorKey: _shellNavigator,
            path: Routes.dashboard.path,
            name: Routes.dashboard.name,
            pageBuilder: (_, __) => const NoTransitionPage(
              child: DashboardPage(),
            ),
          ),
          GoRoute(
            parentNavigatorKey: _shellNavigator,
            path: Routes.map.path,
            name: Routes.map.name,
            pageBuilder: (_, __) => const NoTransitionPage(
              child: MapPage(),
            ),
          ),
          GoRoute(
            parentNavigatorKey: _shellNavigator,
            path: Routes.order.path,
            name: Routes.order.name,
            pageBuilder: (_, __) => const NoTransitionPage(
              child: OrderPage(),
            ),
          ),
          GoRoute(
            parentNavigatorKey: _shellNavigator,
            path: Routes.chat.path,
            name: Routes.chat.name,
            pageBuilder: (_, __) => const NoTransitionPage(
              child: ChatPage(),
            ),
          ),
          GoRoute(
            parentNavigatorKey: _shellNavigator,
            path: Routes.profile.path,
            name: Routes.profile.name,
            pageBuilder: (_, __) => const NoTransitionPage(
              child: ProfilePage(),
            ),
          ),
        ],
      ),
    ],
  );
}
