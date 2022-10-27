import 'package:led_app/Apis/SettingsApi.dart';
import 'package:led_app/Models/settings.dart';

class LedRepository {
  const LedRepository({required SettingsApi settingsApi})
      : _settingsApi = settingsApi;

  final SettingsApi _settingsApi;

  LedControllerSettings getSettings() {
    return _settingsApi.getSettings();
  }

  Future<void> deleteSettings(String id) async {
    await _settingsApi.deleteSettings(id);
  }

  Future<void> saveSettings(LedControllerSettings ctlSettings) async {
    await _settingsApi.saveSettings(ctlSettings);
  }
}
