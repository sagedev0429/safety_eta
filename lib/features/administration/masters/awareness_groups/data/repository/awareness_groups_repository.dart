import '../model/awareness_group.dart';

class AwarenessGroupsRepository {
  Future<List<AwarenessGroup>> getAwarenessGroups() async {
    return <AwarenessGroup>[
      AwarenessGroup(
        awarnessGroup: 'Environmental',
      ),
      AwarenessGroup(
        awarnessGroup: 'Safety',
      ),
      AwarenessGroup(
        awarnessGroup: 'Health Hazard ',
      ),
      AwarenessGroup(
        awarnessGroup: 'Housekeeping',
      ),
    ];
  }
}
