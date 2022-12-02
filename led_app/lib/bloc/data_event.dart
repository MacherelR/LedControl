import 'package:equatable/equatable.dart';
import 'package:led_app/models/settings.dart';

abstract class DataEvent extends Equatable {
  const DataEvent();
  @override
  List<Object> get props => [];
}

class DataEdited extends DataEvent {
  const DataEdited(this.values);
  final LedControllerSettings values;
  @override
  List<Object> get props => [values];
}

class DataSubscriptionRequested extends DataEvent {
  const DataSubscriptionRequested();
}
