

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:led_app/Bloc/led_event.dart';
import 'package:led_app/Bloc/led_state.dart';
import 'package:led_app/Repository/led_Ctl_repository.dart';

class LedBloc extends Bloc<LedEvent,LedState>{
  LedBloc({required LedRepository ledRepository})
      : _ledRepository = ledRepository,
        super(LedState(status: LedStatus.initial));

  final LedRepository _ledRepository;

  Future<void> _onLedSubscriptionRequested(LedSubscriptionRequested event, Emitter<LedState> emit) async {
    emit(state.copyWith(status: LedStatus.ready));
  }

  Future<void> _onLedsValuesModified(LedsValuesModified event, Emitter<LedState> emit) async {
    emit(state.copyWith(status: LedStatus.refresh));
  }
}