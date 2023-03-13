import 'package:animated_sidebar/data/model/entity.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '/data/repository/repository.dart';
import '../data/model/observation_type.dart';

part 'observation_types_event.dart';
part 'observation_types_state.dart';

class ObservationTypesBloc
    extends Bloc<ObservationTypesEvent, ObservationTypesState> {
  final ObservationTypesRepository observationTypesRepository;
  ObservationTypesBloc({
    required this.observationTypesRepository,
  }) : super(const ObservationTypesState()) {
    on<ObservationTypesRetrieved>(_onObservationTypesRetrieved);
  }

  void _onObservationTypesRetrieved(ObservationTypesRetrieved event,
      Emitter<ObservationTypesState> emit) async {
    emit(state.copyWith(status: EntityStatus.loading));
    try {
      List<ObservationType> observationTypes =
          await observationTypesRepository.getObservationTypes();
      emit(state.copyWith(
          observationTypes: observationTypes, status: EntityStatus.succuess));
    } catch (e) {
      emit(state.copyWith(status: EntityStatus.failure));
    }
  }
}
