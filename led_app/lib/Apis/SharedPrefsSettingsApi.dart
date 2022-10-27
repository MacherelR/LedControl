import 'dart:convert';
import 'package:led_app/Apis/SettingsApi.dart';
import 'package:led_app/Models/settings.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsSettingsAPI extends SettingsApi {
  final _settingsKey = "settings_key";
  final SharedPreferences _preferences;

  SharedPrefsSettingsAPI({required SharedPreferences plugin})
      : _preferences = plugin {
    final settingsJson = _getValue(_settingsKey);
    if (settingsJson != null) {
      final settings = json.decode(settingsJson);
    } else {
      final settings = const LedControllerSettings();
    }
  }

  @override
  Future<void> deleteSettings(String id) {
    throw UnimplementedError();
  }
}
