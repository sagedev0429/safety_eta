// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'theme_bloc.dart';

class ThemeEvent extends Equatable {
  const ThemeEvent();

  @override
  List<Object> get props => [];
}

class ThemeSidebarExtended extends ThemeEvent {}

class ThemeSidebarShrank extends ThemeEvent {}

class ThemeSidebarSelected extends ThemeEvent {
  final String selectedItemName;
  const ThemeSidebarSelected({
    required this.selectedItemName,
  });

  @override
  List<Object> get props => [selectedItemName];
}

class ThemeSidebarHovered extends ThemeEvent {
  final String hoveredItemName;
  const ThemeSidebarHovered({
    this.hoveredItemName = '',
  });

  @override
  List<Object> get props => [hoveredItemName];
}


