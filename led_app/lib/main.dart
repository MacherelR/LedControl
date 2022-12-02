import 'package:flutter/material.dart';
import 'package:led_app/repository/led_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'api/shared_pref_api.dart';
import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final sharedPrefsStorage =
      SharedPrefsSettingsAPI(plugin: await SharedPreferences.getInstance());
  runApp(App(ledRepository: LedRepository(settingsApi: sharedPrefsStorage)));
}
