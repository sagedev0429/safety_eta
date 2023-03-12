abstract class Entity {
  Map<String, dynamic> tableItemsToMap();
  Map<String, dynamic> detailItemsToMap();
}

enum EntityStatus {
  initial,
  loading,
  succuess,
  failure,
}
