// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'observation_types_bloc.dart';

class ObservationTypesState extends Equatable {
  final List<ObservationType> observationTypes;
  final EntityStatus status;
  const ObservationTypesState({
    this.observationTypes = const [],
    this.status = EntityStatus.initial,
  });

  @override
  List<Object> get props => [
        observationTypes,
        status,
      ];

  ObservationTypesState copyWith({
    List<ObservationType>? observationTypes,
    EntityStatus? status,
  }) {
    return ObservationTypesState(
      observationTypes: observationTypes ?? this.observationTypes,
      status: status ?? this.status,
    );
  }
}
