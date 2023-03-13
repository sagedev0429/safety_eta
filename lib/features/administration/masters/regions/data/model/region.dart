import 'package:equatable/equatable.dart';

import '/data/model/entity.dart';


class Region extends Entity implements Equatable {
  final String regionName;
  final String timezonesAssociated;
  final bool active;
  Region({
    required this.regionName,
    required this.timezonesAssociated,
    required this.active,
  });

  @override
  Map<String, dynamic> detailItemsToMap() {
    return <String, dynamic>{
      'Region Name': regionName,
      'Time Zones Associated': timezonesAssociated,
      'Active': active,
    };
  }

  @override
  Map<String, dynamic> tableItemsToMap() {
    return <String, dynamic>{
      'Region Name': regionName,
      'Time Zones Associated': timezonesAssociated,
      'Active': active,
    };
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'regionName': regionName,
      'timezonesAssociated': timezonesAssociated,
      'active': active,
    };
  }

  factory Region.fromMap(Map<String, dynamic> map) {
    return Region(
      regionName: map['regionName'] as String,
      timezonesAssociated: map['timezonesAssociated'] as String,
      active: map['active'] as bool,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        regionName,
        timezonesAssociated,
        active,
      ];

  @override
  bool? get stringify => throw UnimplementedError();
}
