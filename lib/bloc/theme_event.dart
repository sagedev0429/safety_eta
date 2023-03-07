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
  final int index;
  const ThemeSidebarSelected({
    required this.index,
  });

  @override
  List<Object> get props => [index];
}
