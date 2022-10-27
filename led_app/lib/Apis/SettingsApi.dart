

import 'package:led_app/Models/settings.dart';

abstract class SettingsApi {
  Future<void> deleteSettings(String id);
  LedControllerSettings getSettings();
  Future<void> saveSettings(LedControllerSettings tunerSettings);
}