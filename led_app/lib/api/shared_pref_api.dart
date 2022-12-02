import 'package:led_app/api/led_api.dart';
import 'package:led_app/models/settings.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class SharedPrefsSettingsAPI extends SettingsApi {
  final _settingsKey = "settings_key";
  final SharedPreferences _preferences;

  SharedPrefsSettingsAPI({required SharedPreferences plugin})
      : _preferences = plugin {
    final settingsJson = _getValue(_settingsKey);
    if (settingsJson != null) {
      final settings = (json.decode(settingsJson));
    } else {
      final settings = const LedControllerSettings();
    }
  }

  String? _getValue(String key) => _preferences.getString(_settingsKey);
  Future<void> _setValue(String key, String value) =>
      _preferences.setString(key, value);

  @override
  LedControllerSettings getSettings() {
    final settingsJson = _getValue(_settingsKey);
    if (settingsJson != null) {
      final decoded = (json.decode(settingsJson)) as Map<String, dynamic>;
      var decodedSettings = LedControllerSettings.fromJson(decoded);
      return decodedSettings;
    } else {
      return const LedControllerSettings();
    }
  }

  @override
  Future<void> setSettings(LedControllerSettings settings) {
    return _setValue(_settingsKey, json.encode(settings));
  }
}
