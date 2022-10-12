

import 'package:equatable/equatable.dart';

enum LedStatus {
  initial,
  ready,
  refresh
}

class LedState extends Equatable{
  LedState(
    {this.status = LedStatus.initial,}
  );

  final LedStatus status;

  LedState copyWith({
    LedStatus? status,
  }) {
    return LedState(
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [status];
}