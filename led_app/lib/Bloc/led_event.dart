


import 'package:equatable/equatable.dart';

abstract class LedEvent extends Equatable {
  const LedEvent();
  @override
  List<Object> get props => [];
}


class LedSubscriptionRequested extends LedEvent {
  const LedSubscriptionRequested();
}

class LedsValuesModified extends LedEvent {
  const LedsValuesModified();
}