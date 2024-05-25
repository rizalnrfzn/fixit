import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../utils.dart';

enum ActiveTheme {
  light(ThemeMode.light),
  dark(ThemeMode.dark),
  system(ThemeMode.system);

  final ThemeMode mode;

  const ActiveTheme(this.mode);
}

enum MainBoxKeys {
  token,
  isOnboardPassed,
  isRegistered,
  authUserId,
  fcm,
  language,
  theme,
  locale,
  isLogin,
  lastLocation,
}

enum MainBoxKeysModel {
  authUser(0),
  geolocation(1),
  ;

  const MainBoxKeysModel(this.id);

  final int id;
}

mixin class MainBoxMixin {
  static late Box? mainBox;
  static const _boxName = 'flutter_auth_app';

  static Future<void> initHive(String prefixBox) async {
    // Initialize hive (persistent database)
    await Hive.initFlutter();
    mainBox = await Hive.openBox("$prefixBox$_boxName");
  }

  Future<void> addData<T>(MainBoxKeys key, T value) async {
    await mainBox?.put(key.name, value);
  }

  Future<void> removeData(MainBoxKeys key) async {
    await mainBox?.delete(key.name);
  }

  T getData<T>(MainBoxKeys key) => mainBox?.get(key.name) as T;

  Future<void> logoutBox() async {
    /// Clear the box
    removeData(MainBoxKeys.isLogin);
    removeData(MainBoxKeys.isRegistered);
    removeData(MainBoxKeys.authUserId);
    removeData(MainBoxKeys.token);
  }

  Future<void> addModel<T>(MainBoxKeysModel key, T value) async {
    await mainBox?.add(value);
  }

  T getModel<T>(MainBoxKeysModel key) => mainBox?.getAt(key.id);

  Future<void> removeModel(MainBoxKeysModel key) async {
    await mainBox?.deleteAt(key.id);
  }

  Future<void> closeBox({bool isUnitTest = false}) async {
    try {
      if (mainBox != null) {
        await mainBox?.close();
        await mainBox?.deleteFromDisk();
      }
    } catch (e, stackTrace) {
      if (!isUnitTest) {
        FirebaseCrashLogger().nonFatalError(error: e, stackTrace: stackTrace);
      }
    }
  }
}
