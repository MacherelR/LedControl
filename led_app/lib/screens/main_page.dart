import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:led_app/bloc/data_bloc.dart';
import 'package:led_app/bloc/data_event.dart';
import 'package:led_app/repository/led_repository.dart';
import 'package:led_app/screens/custom_color_picker.dart';
import 'package:provider/provider.dart';

import '../bloc/data_state.dart';
import '../models/hsv_picker.dart';
import '../models/numberColorSelector.dart';
import '../models/numberInput.dart';
import '../models/settings.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DataBloc(
        ledRepository: context.read<LedRepository>(),
      )..add(const DataSubscriptionRequested()),
      child: MainView(),
    );
  }
}

class MainView extends StatelessWidget {
  // ignore: prefer_const_constructors_in_immutables
  MainView({Key? key}) : super(key: key);
  late ColorSelector colorSelector;
  Color currentColor = Color.fromARGB(255, 17, 16, 14);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DataBloc, DataState>(
      builder: (context, state) {
        // return colorSelector = ColorSelector(
        //     rValue: state.values.rValue,
        //     gValue: state.values.gValue,
        //     bValue: state.values.bValue,
        //     onChanged: () => context.read<DataBloc>().add(
        //           DataEdited(
        //             LedControllerSettings(
        //               rVal: colorSelector.rValue,
        //               gVal: colorSelector.gValue,
        //               bVal: colorSelector.bValue,
        //             ),
        //           ),
        //         ));
        return Scaffold(
          body: Center(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("COUCOU"),
              CustomColorPicker(),
            ],
          )),
        );
      },
    );
  }
}
