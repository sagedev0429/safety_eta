import 'package:animated_sidebar/data/model/entity.dart';
import 'package:animated_sidebar/data/repository/repository.dart';
import 'package:animated_sidebar/features/administration/masters/priority_levels/data/model/priority_level.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'priority_levels_event.dart';
part 'priority_levels_state.dart';

class PriorityLevelsBloc
    extends Bloc<PriorityLevelsEvent, PriorityLevelsState> {
  final PriorityLevelsRepository priorityLevelsRepository;
  PriorityLevelsBloc({
    required this.priorityLevelsRepository,
  }) : super(const PriorityLevelsState()) {
    on<PriorityLevelsRetrieved>(_onPriorityLevelsRetrieved);
  }

  void _onPriorityLevelsRetrieved(
      PriorityLevelsRetrieved event, Emitter<PriorityLevelsState> emit) async {
    emit(state.copyWith(status: EntityStatus.loading));
    try {
      List<PriorityLevel> priorityLevels =
          await priorityLevelsRepository.getPriorityLevels();
      emit(state.copyWith(
        priorityLevels: priorityLevels,
        status: EntityStatus.succuess,
      ));
    } catch (e) {
      emit(state.copyWith(status: EntityStatus.failure));
    }
  }
}
