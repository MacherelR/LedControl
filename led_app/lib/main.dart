import 'package:flutter/material.dart';

import 'Repository/led_ctl_repository.dart';
import 'app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const App(
    ledRepository : LedRepository(),
  ));
}

