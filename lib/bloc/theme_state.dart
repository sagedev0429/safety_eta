part of 'theme_bloc.dart';

class ThemeState extends Equatable {
  const ThemeState({
    this.isSidebarExtended = true,
    this.selectedIndex = 0,
  });
  final bool isSidebarExtended;
  final int selectedIndex;

  @override
  List<Object> get props => [
        isSidebarExtended,
        selectedIndex,
      ];

  ThemeState copyWith({
    bool? isSidebarExtended,
    int? selectedIndex,
  }) {
    return ThemeState(
      isSidebarExtended: isSidebarExtended ?? this.isSidebarExtended,
      selectedIndex: selectedIndex ?? this.selectedIndex,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'isSidebarExtended': isSidebarExtended,
      'selectedIndex': selectedIndex,
    };
  }

  factory ThemeState.fromMap(Map<String, dynamic> map) {
    return ThemeState(
      isSidebarExtended: map['isSidebarExtended'] as bool,
      selectedIndex: map['selectedIndex'] as int,
    );
  }
}

class ThemeInitial extends ThemeState {}
