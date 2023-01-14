import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:led_app/bloc/data_bloc.dart';
import 'package:led_app/bloc/data_event.dart';
import 'package:led_app/repository/led_repository.dart';
import 'package:provider/provider.dart';

import '../bloc/data_state.dart';
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
//Text(state.values.rValue.toString())

class MainView extends StatelessWidget {
  // ignore: prefer_const_constructors_in_immutables
  MainView({Key? key}) : super(key: key);
  late ColorSelector colorSelector;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DataBloc, DataState>(
      builder: (context, state) {
        // return Scaffold(
        //   body: Center(
        //     child: Row(
        //       mainAxisAlignment: MainAxisAlignment.center,
        //       children: [
        //         SizedBox(
        //           width: 100,
        //           child: NumberInputField(
        //             label: "R",
        //             initialValue: state.values.rValue.toString(),
        //             onChanged: (value) => context.read<DataBloc>().add(
        //                 DataEdited(LedControllerSettings(
        //                     rVal: state.values.rValue,
        //                     gVal: state.values.gValue,
        //                     bVal: state.values.bValue))),
        //           ),
        //         ),
        //         SizedBox(
        //           width: 100,
        //           child: NumberInputField(
        //             label: "G",
        //             initialValue: state.values.gValue.toString(),
        //             onChanged: (value) => context.read<DataBloc>().add(
        //                 DataEdited(LedControllerSettings(
        //                     rVal: state.values.rValue,
        //                     gVal: state.values.gValue,
        //                     bVal: state.values.bValue))),
        //           ),
        //         ),
        //         SizedBox(
        //           width: 100,
        //           child: NumberInputField(
        //             label: "B",
        //             initialValue: state.values.bValue.toString(),
        //             onChanged: (value) => context.read<DataBloc>().add(
        //                 DataEdited(LedControllerSettings(
        //                     rVal: state.values.rValue,
        //                     gVal: state.values.gValue,
        //                     bVal: state.values.bValue))),
        //           ),
        //         ),
        //       ],
        //     ),
        //   ),
        // );
        return colorSelector = ColorSelector(
            rValue: state.values.rValue,
            gValue: state.values.gValue,
            bValue: state.values.bValue,
            onChanged: () => context.read<DataBloc>().add(
                  DataEdited(
                    LedControllerSettings(
                      rVal: colorSelector.rValue,
                      gVal: colorSelector.gValue,
                      bVal: colorSelector.bValue,
                    ),
                  ),
                ));
      },
    );
  }
}
