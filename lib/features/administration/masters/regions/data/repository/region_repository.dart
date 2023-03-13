import '../model/regions.dart';

class RegionRepository {
  List<Region> getRegions() {
    return <Region>[
      Region(
        regionName: 'North America',
        timezonesAssociated: 'EST. CST and PST',
        active: true,
      ),
      Region(
        regionName: 'Asia',
        timezonesAssociated: 'Japan Standard Time, India Standard Time & Arabian Standard',
        active: true,
      ),
      Region(
        regionName: 'Eastern Europe',
        timezonesAssociated: 'Moscow Standard, Central Europen Standard, GMT',
        active: false,
      ),
      Region(
        regionName: 'Asia',
        timezonesAssociated: 'Japan Standard Time, India Standard Time & Arabian Standard',
        active: true,
      ),
    ];
  }
}
