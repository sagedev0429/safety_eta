part of 'awareness_groups_bloc.dart';

abstract class AwarenessGroupsEvent extends Equatable {
  const AwarenessGroupsEvent();

  @override
  List<Object> get props => [];
}

class AwarenessGroupsRetrieved extends AwarenessGroupsEvent {}
