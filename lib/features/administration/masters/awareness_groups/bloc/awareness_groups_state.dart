// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'awareness_groups_bloc.dart';

class AwarenessGroupsState extends Equatable {
  final List<AwarenessGroup> awarenessGroups;
  final EntityStatus status;
  const AwarenessGroupsState({
    this.awarenessGroups = const [],
    this.status = EntityStatus.initial,
  });

  @override
  List<Object> get props => [
        awarenessGroups,
        status,
      ];

  AwarenessGroupsState copyWith({
    List<AwarenessGroup>? awarenessGroups,
    EntityStatus? status,
  }) {
    return AwarenessGroupsState(
      awarenessGroups: awarenessGroups ?? this.awarenessGroups,
      status: status ?? this.status,
    );
  }
}
