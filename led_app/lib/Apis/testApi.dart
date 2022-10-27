import 'dart:html';

import 'package:led_app/Apis/SettingsApi.dart';
import 'package:led_app/Models/settings.dart';

class TestApi extends SettingsApi {
  final _key = "settings_key";

  TestApi() {
    print("TestApi constructor");
  }

  // final String name;
  @override
  Future<void> deleteSettings(String id) {
    throw UnimplementedError();
  }

  @override
  LedControllerSettings getSettings() {
    throw UnimplementedError();
  }

  @override
  Future<void> saveSettings(LedControllerSettings tunerSettings) {
    throw UnimplementedError();
  }
}
