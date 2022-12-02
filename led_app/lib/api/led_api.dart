import 'package:led_app/models/settings.dart';

abstract class SettingsApi {
  LedControllerSettings getSettings();
  Future<void> setSettings(LedControllerSettings settings);
}
