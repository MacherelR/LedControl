

import 'package:equatable/equatable.dart';

import '../Models/settings.dart';

enum SettingsStatus { initial, loading, loaded, error }

class SettingsState extends Equatable {
  const SettingsState(
      {this.status = SettingsStatus.initial,
      this.settings = const LedControllerSettings()});
  final SettingsStatus status;
  final LedControllerSettings settings;

  SettingsState copyWith({SettingsStatus? status, LedControllerSettings? settings}) {
    return SettingsState(
        status: status ?? this.status, settings: settings ?? this.settings);
  }

  @override
  List<Object> get props => [status, settings];
}