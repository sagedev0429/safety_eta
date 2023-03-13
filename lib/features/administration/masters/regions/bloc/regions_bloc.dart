import '/data/model/entity.dart';
import '../data/model/region.dart';
import '/features/administration/masters/regions/data/repository/regions_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'regions_event.dart';
part 'regions_state.dart';

class RegionsBloc extends Bloc<RegionsEvent, RegionsState> {
  final RegionsRepository regionsRepository;
  RegionsBloc({
    required this.regionsRepository,
  }) : super(const RegionsState()) {
    on<RegionsRetrieved>(_onRegionsRetrieved);
  }

  _onRegionsRetrieved(
      RegionsRetrieved event, Emitter<RegionsState> emit) async {
    emit(state.copyWith(status: EntityStatus.loading));
    try {
      List<Region> regions = await regionsRepository.getRegions();
      emit(state.copyWith(regions: regions, status: EntityStatus.succuess));
    } catch (e) {
      emit(state.copyWith(status: EntityStatus.failure));
    }
  }
}
