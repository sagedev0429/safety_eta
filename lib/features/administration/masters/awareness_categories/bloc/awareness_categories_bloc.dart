import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '/data/model/entity.dart';
import '../data/model/awareness_category.dart';

part 'awareness_categories_event.dart';
part 'awareness_categories_state.dart';

class AwarenessCategoriesBloc extends Bloc<AwarenessCategoriesEvent, AwarenessCategoriesState> {
  AwarenessCategoriesBloc() : super(const AwarenessCategoriesState()) {
    on<AwarenessCategoriesEvent>((event, emit) {
      
    });
  }
}
