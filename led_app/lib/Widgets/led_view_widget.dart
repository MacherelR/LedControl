

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:led_app/Bloc/led_bloc.dart';
import 'package:led_app/Bloc/led_state.dart';

class LedViewWidget extends StatefulWidget{
  const LedViewWidget({Key? key}) : super(key: key);
  static const String route = '/home';
  @override
  State<LedViewWidget> createState() => _LedViewWidgetState();
}

class _LedViewWidgetState extends State<LedViewWidget>{

  @override
  void dispose() {
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LedBloc,LedState>(builder: (context,state) {
      return const Scaffold(
        body: Center(
          child:
          Text("Initial test :)") ),
      );
    });
  }
}