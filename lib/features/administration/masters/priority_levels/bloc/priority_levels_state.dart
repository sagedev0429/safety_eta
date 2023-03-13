// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'priority_levels_bloc.dart';

class PriorityLevelsState extends Equatable {
  final List<PriorityLevel> priorityLevels;
  final EntityStatus status;
  const PriorityLevelsState({
    this.priorityLevels = const [],
    this.status = EntityStatus.initial,
  });

  @override
  List<Object> get props => [
        priorityLevels,
        status,
      ];

  PriorityLevelsState copyWith({
    List<PriorityLevel>? priorityLevels,
    EntityStatus? status,
  }) {
    return PriorityLevelsState(
      priorityLevels: priorityLevels ?? this.priorityLevels,
      status: status ?? this.status,
    );
  }
}
