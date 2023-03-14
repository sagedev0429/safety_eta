import '../model/awareness_category.dart';

class AwarenessCategoriesRepository {
  Future<List<AwarenessCategory>> getAwarenessCategories() async {
    return <AwarenessCategory>[
      AwarenessCategory(
        awarenessCategory: 'Electrical',
        active: true,
      ),
      AwarenessCategory(
        awarenessCategory: 'Environmental',
        active: true,
      ),
      AwarenessCategory(
        awarenessCategory: 'Equipment / Vehicle Use',
        active: true,
      ),
      AwarenessCategory(
        awarenessCategory: 'Excavation',
        active: true,
      ),
      AwarenessCategory(
        awarenessCategory: 'Fall Protection',
        active: false,
      ),
      AwarenessCategory(
        awarenessCategory: 'Fire prevention',
        active: true,
      ),
      AwarenessCategory(
        awarenessCategory: 'Health Hazards',
        active: true,
      ),
      AwarenessCategory(
        awarenessCategory: 'Housekeeping',
        active: true,
      ),
      AwarenessCategory(
        awarenessCategory: 'Manual Lifting',
        active: true,
      ),

    ];
  }
}
