import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:led_app/bloc/data_bloc.dart';
import 'package:led_app/bloc/data_event.dart';
import 'package:led_app/repository/led_repository.dart';
import 'package:provider/provider.dart';

import '../bloc/data_state.dart';
import '../models/settings.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DataBloc(
        ledRepository: context.read<LedRepository>(),
      )..add(const DataSubscriptionRequested()),
      child: const MainView(),
    );
  }
}
//Text(state.values.rValue.toString())

class MainView extends StatelessWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DataBloc, DataState>(
      builder: (context, state) {
        return Scaffold(
          body: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 100,
                  child: TextFormField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "R",
                        hintText: "Red component value",
                      ),
                      initialValue: state.values.rValue.toString(),
                      validator: (value) {
                        print("Validator called");
                        if (value != null) {
                          var val = int.tryParse(value);
                          print("tryparse: $val");
                          if (val == null || val < 0 || val > 255) {
                            return "Value must be integer between 0 and 255";
                          }
                          return val.toString();
                        }
                        return "Null value inserted";
                      },
                      onChanged: (value) => context.read<DataBloc>().add(
                          DataEdited(LedControllerSettings(
                              rVal: state.values.rValue,
                              gVal: state.values.gValue,
                              bVal: state.values.bValue)))),
                ),
                SizedBox(
                  width: 100,
                  child: TextFormField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "G",
                      hintText: "Green component value",
                    ),
                    initialValue: state.values.gValue.toString(),
                    validator: (String? value) {
                      if (value != null) {
                        var val = int.tryParse(value);
                        if (val == null || val < 0 || val > 255) {
                          return "Value must be integer between 0 and 255";
                        }
                        return val.toString();
                      }
                      return "Null value inserted";
                    },
                  ),
                ),
                SizedBox(
                  width: 100,
                  child: TextFormField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "B",
                    ),
                    initialValue: state.values.bValue.toString(),
                    validator: (String? value) {
                      if (value != null) {
                        var val = int.tryParse(value);
                        if (val == null || val < 0 || val > 255) {
                          return "Value must be integer between 0 and 255";
                        }
                        return val.toString();
                      }
                      return "Null value inserted";
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
