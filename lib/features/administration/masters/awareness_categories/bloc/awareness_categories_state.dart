part of 'awareness_categories_bloc.dart';

class AwarenessCategoriesState extends Equatable {
  final List<AwarenessCategory> awarenessCategories;
  final EntityStatus status;

  const AwarenessCategoriesState({
    this.awarenessCategories = const [],
    this.status = EntityStatus.initial,
  });

  @override
  List<Object> get props => [
        awarenessCategories,
        status,
      ];
}
