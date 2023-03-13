part of 'observation_types_bloc.dart';

abstract class ObservationTypesEvent extends Equatable {
  const ObservationTypesEvent();

  @override
  List<Object> get props => [];
}

class ObservationTypesRetrieved extends ObservationTypesEvent {}
