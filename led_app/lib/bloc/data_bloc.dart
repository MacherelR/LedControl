import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:led_app/bloc/data_event.dart';
import 'package:led_app/bloc/data_state.dart';
import 'package:led_app/models/settings.dart';
import 'package:led_app/repository/led_repository.dart';

class DataBloc extends Bloc<DataEvent, DataState> {
  DataBloc({required LedRepository ledRepository})
      : _ledRepository = ledRepository,
        super(DataState(status: DataStatus.initial)) {
    on<DataEdited>(_onDataEdited);
    on<DataSubscriptionRequested>(_onDataSubscriptionRequested);
  }

  final LedRepository _ledRepository;

  Future<void> _onDataEdited(DataEdited event, Emitter<DataState> emit) async {
    print("Data edited with values: ${event.values.rValue}");
    emit(state.copyWith(status: DataStatus.loading));
    try {
      await _ledRepository.saveSettings(event.values);
      emit(state.copyWith(status: DataStatus.success, values: event.values));
    } catch (_) {
      emit(state.copyWith(status: DataStatus.failure));
    }
  }

  void _onDataSubscriptionRequested(
      DataSubscriptionRequested event, Emitter<DataState> emit) async {
    emit(state.copyWith(status: DataStatus.loading));
    LedControllerSettings data = await _ledRepository.getSettings();
    emit(state.copyWith(status: DataStatus.success, values: data));
  }
}
