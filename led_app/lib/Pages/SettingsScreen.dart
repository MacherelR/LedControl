

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:led_app/Repository/led_Ctl_repository.dart';

import '../Bloc/settings_bloc.dart';
import '../Bloc/settings_event.dart';
import '../Bloc/settings_state.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SettingsBloc(
        settingsRepository: context.read<LedRepository>(),
      )..add(const SettingsSubscriptionRequested()),
      child: const SettingsView(),
    );
  }
}

class SettingsView extends StatelessWidget {
  const SettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsBloc, SettingsState>(builder: (context, state) {
      if (state.status == SettingsStatus.loading) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }

      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        // ignore: prefer_const_literals_to_create_immutables
        children: <Widget>[
          const Center(child: Text("Settings Page :)")),
        ],
      );
    });
  }
}