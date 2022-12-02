import 'package:led_app/models/settings.dart';
import 'package:equatable/equatable.dart';

enum DataStatus { initial, loading, success, failure }

class DataState extends Equatable {
  const DataState(
      {this.status = DataStatus.initial,
      this.values = const LedControllerSettings()});
  final DataStatus status;
  final LedControllerSettings values;

  DataState copyWith({DataStatus? status, LedControllerSettings? values}) {
    return DataState(
        status: status ?? this.status, values: values ?? this.values);
  }

  @override
  List<Object> get props => [status, values];
}
