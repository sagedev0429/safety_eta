import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'priority_levels_event.dart';
part 'priority_levels_state.dart';

class PriorityLevelsBloc extends Bloc<PriorityLevelsEvent, PriorityLevelsState> {
  PriorityLevelsBloc() : super(PriorityLevelsInitial()) {
    on<PriorityLevelsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
