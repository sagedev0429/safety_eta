part of 'theme_bloc.dart';

class ThemeState extends Equatable {
  const ThemeState(
      {this.isSidebarExtended = true,
      this.selectedItemName = 'Dashboard',
      this.hoveredItemName = ''});
  final bool isSidebarExtended;
  final String selectedItemName;
  final String hoveredItemName;

  @override
  List<Object> get props => [
        isSidebarExtended,
        selectedItemName,
        hoveredItemName,
      ];

  ThemeState copyWith({
    bool? isSidebarExtended,
    String? selectedItemName,
    String? hoveredItemName,
  }) {
    return ThemeState(
      isSidebarExtended: isSidebarExtended ?? this.isSidebarExtended,
      selectedItemName: selectedItemName ?? this.selectedItemName,
      hoveredItemName: hoveredItemName ?? this.hoveredItemName,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'isSidebarExtended': isSidebarExtended,
      'selectedItemName': selectedItemName,
      'hoveredItemName': '',
    };
  }

  factory ThemeState.fromMap(Map<String, dynamic> map) {
    return ThemeState(
      isSidebarExtended: map['isSidebarExtended'] as bool,
      selectedItemName: map['selectedItemName'] as String,
      hoveredItemName: map['hoveredItemName'] as String,
    );
  }
}
