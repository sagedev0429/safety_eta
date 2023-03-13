import '../model/observation_type.dart';

class ObservationTypesRepository {
  Future<List<ObservationType>> getObservationTypes() async {
    return <ObservationType>[
      ObservationType(
        observationType: 'Good Catch',
        severity: 'Good Catch',
        visibility: 'Everywhere	',
        active: true,
      ),
      ObservationType(
        observationType: 'Near Miss',
        severity: 'Near Miss',
        visibility: 'Everywhere	',
        active: true,
      ),
      ObservationType(
        observationType: 'Near Miss',
        severity: 'Unsafe',
        visibility: 'Everywhere	',
        active: false,
      ),
      ObservationType(
        observationType: 'Near Miss',
        severity: 'Unsafe',
        visibility: 'Everywhere	',
        active: true,
      ),
    ];
  }
}
