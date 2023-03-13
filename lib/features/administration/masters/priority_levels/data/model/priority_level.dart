// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '/data/model/entity.dart';

class PriorityLevel extends Entity implements Equatable {
  final String priorityLevel;
  final Color colorAssociated;
  final String priorityType;
  final bool active;
  PriorityLevel({
    required this.priorityLevel,
    required this.colorAssociated,
    required this.priorityType,
    required this.active,
  });
  @override
  Map<String, dynamic> detailItemsToMap() {
    return <String, dynamic>{
      'Priority Level': priorityLevel,
      'Color associated': colorAssociated,
      'Priority Type': priorityType,
      'Active': active,
    };
  }

  @override
  List<Object?> get props => [
        priorityLevel,
        colorAssociated,
        priorityType,
        active,
      ];

  @override
  // TODO: implement stringify
  bool? get stringify => throw UnimplementedError();

  @override
  Map<String, dynamic> tableItemsToMap() {
    return <String, dynamic>{
      'Priority Level': priorityLevel,
      'Color associated': colorAssociated,
      'Priority Type': priorityType,
      'Active': active,
    };
  }

  PriorityLevel copyWith({
    String? priorityLevel,
    Color? colorAssociated,
    String? priorityType,
    bool? active,
  }) {
    return PriorityLevel(
      priorityLevel: priorityLevel ?? this.priorityLevel,
      colorAssociated: colorAssociated ?? this.colorAssociated,
      priorityType: priorityType ?? this.priorityType,
      active: active ?? this.active,
    );
  }
}
