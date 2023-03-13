// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'regions_bloc.dart';

class RegionsState extends Equatable {
  final List<Region> regions;
  final EntityStatus status;
  const RegionsState({
    this.regions = const [],
    this.status = EntityStatus.initial,
  });

  @override
  List<Object> get props => [
        regions,
        status,
      ];

  RegionsState copyWith({
    List<Region>? regions,
    EntityStatus? status,
  }) {
    return RegionsState(
      regions: regions ?? this.regions,
      status: status ?? this.status,
    );
  }
}
