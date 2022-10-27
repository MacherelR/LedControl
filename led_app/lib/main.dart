import 'package:flutter/material.dart';
import 'package:led_app/Apis/testApi.dart';

import 'Repository/led_ctl_repository.dart';
import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  TestApi fakeApi = TestApi();
  runApp(App(ledRepository: LedRepository(settingsApi: fakeApi)));
}
