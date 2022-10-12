

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:led_app/Bloc/settings_event.dart';
import 'package:led_app/Bloc/settings_state.dart';
import 'package:led_app/Models/settings.dart';
import 'package:led_app/Repository/led_Ctl_repository.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc({required LedRepository settingsRepository})
      : _settingsRepository = settingsRepository,
        super(SettingsState(status: SettingsStatus.initial)) {
    on<SettingsEdited>(_onSettingsEdited);
    on<SettingsSubscriptionRequested>(_onSettingsSubscriptionRequested);
  }

  final LedRepository _settingsRepository;

  // Future<void> _onSettingsEdited(
  //     SettingsEdited event, Emitter<SettingsState> emit) async {
  //   emit(state.copyWith(status: SettingsStatus.loading));
  //   TunerSettings settings = await _settingsRepository.getSettings();
  //   emit(SettingsState(status: SettingsStatus.loaded, settings: settings));
  // }
  Future<void> _onSettingsEdited(
      SettingsEdited event, Emitter<SettingsState> emit) async {
    emit(state.copyWith(status: SettingsStatus.loading));
    // await _settingsRepository.saveSettings(event.settings);
    emit(state.copyWith(status: SettingsStatus.loaded, settings: event.settings));
  }

  Future<void> _onSettingsSubscriptionRequested(
      SettingsSubscriptionRequested event, Emitter<SettingsState> emit) async {
    emit(state.copyWith(status: SettingsStatus.loading));
    Future.delayed(const Duration(seconds: 2), (){
      emit(state.copyWith(status: SettingsStatus.loaded ));
    });
    // LedControllerSettings settings = await _settingsRepository.getSettings();
    // emit(state.copyWith(status: SettingsStatus.loaded, settings: settings));
  }
}