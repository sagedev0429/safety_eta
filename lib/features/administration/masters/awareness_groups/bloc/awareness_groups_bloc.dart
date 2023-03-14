import 'package:animated_sidebar/data/model/entity.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../data/model/awareness_group.dart';
import '/data/repository/repository.dart';

part 'awareness_groups_event.dart';
part 'awareness_groups_state.dart';

class AwarenessGroupsBloc
    extends Bloc<AwarenessGroupsEvent, AwarenessGroupsState> {
  final AwarenessGroupsRepository awarenessGroupRepository;
  AwarenessGroupsBloc({
    required this.awarenessGroupRepository,
  }) : super(const AwarenessGroupsState()) {
    on<AwarenessGroupsRetrieved>(_onAwarenessGroupsRetrieved);
  }

  void _onAwarenessGroupsRetrieved(AwarenessGroupsRetrieved event,
      Emitter<AwarenessGroupsState> emit) async {
    emit(state.copyWith(status: EntityStatus.loading));
    try {
      List<AwarenessGroup> awarenessGroups =
          await awarenessGroupRepository.getAwarenessGroups();
      emit(state.copyWith(
          status: EntityStatus.succuess, awarenessGroups: awarenessGroups));
    } catch (e) {
      emit(state.copyWith(status: EntityStatus.failure));
    }
  }
}
