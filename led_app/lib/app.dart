

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:led_app/Pages/HomePage.dart';
import 'package:led_app/Repository/led_ctl_repository.dart';
class App extends StatefulWidget{
  const App({Key? key, required this.ledRepository}) : super(key: key);

  final LedRepository ledRepository;

  @override
  State<App> createState() => _AppState();
}


class _AppState extends State<App>{
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: widget.ledRepository,
      child: MaterialApp(
        onGenerateTitle: (context) => 'LED Control',
        routes: {HomePage.route: (context) => const HomePage()} ,
        initialRoute: HomePage.route,
      ),);
  }
}