part of 'priority_levels_bloc.dart';

abstract class PriorityLevelsEvent extends Equatable {
  const PriorityLevelsEvent();

  @override
  List<Object> get props => [];
}

class PriorityLevelsRetrieved extends PriorityLevelsEvent {}
