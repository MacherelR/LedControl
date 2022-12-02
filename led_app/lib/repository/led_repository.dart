import 'package:led_app/models/settings.dart';
import 'package:led_app/api/led_api.dart';

class LedRepository {
  const LedRepository({required SettingsApi settingsApi})
      : _settingsApi = settingsApi;

  final SettingsApi _settingsApi;

  Future<void> saveSettings(LedControllerSettings settings) =>
      _settingsApi.setSettings(settings);
  LedControllerSettings getSettings() => _settingsApi.getSettings();
}
