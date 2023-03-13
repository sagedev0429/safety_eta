// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'regions_bloc.dart';

abstract class RegionsEvent extends Equatable {
  const RegionsEvent();

  @override
  List<Object> get props => [];
}

class RegionsRetrieved extends RegionsEvent {}
