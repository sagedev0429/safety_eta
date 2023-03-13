import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends HydratedBloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(const ThemeState()) {
    on<ThemeSidebarExtended>((event, emit) {
      emit(state.copyWith(isSidebarExtended: true));
    });

    on<ThemeSidebarShrank>((event, emit) {
      emit(state.copyWith(isSidebarExtended: false));
    });

    // on<ThemeSidebarSelected>(
    //   (event, emit) {
    //     emit(state.copyWith(selectedItemName: event.selectedItemName));
    //   },
    // );

    on<ThemeSidebarHovered>(
      (event, emit) {
        emit(state.copyWith(hoveredItemName: event.hoveredItemName));
      },
    );
  }

  @override
  ThemeState? fromJson(Map<String, dynamic> json) {
    return ThemeState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(ThemeState state) {
    return state.toMap();
  }
}
