// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import '/data/model/entity.dart';

class AwarenessGroup extends Entity implements Equatable {
  final String awarnessGroup;
  AwarenessGroup({
    required this.awarnessGroup,
  });
  @override
  Map<String, dynamic> detailItemsToMap() {
    return <String, dynamic>{
      'Awareness Group': awarnessGroup,
    };
  }

  @override
  List<Object?> get props => [
        awarnessGroup,
      ];

  @override
  bool? get stringify => throw UnimplementedError();

  @override
  Map<String, dynamic> tableItemsToMap() {
    return <String, dynamic>{
      'Awareness Group': awarnessGroup,
    };
  }

  AwarenessGroup copyWith({
    String? awarnessGroup,
  }) {
    return AwarenessGroup(
      awarnessGroup: awarnessGroup ?? this.awarnessGroup,
    );
  }
}
