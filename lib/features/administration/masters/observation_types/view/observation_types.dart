import 'package:flutter/material.dart';

import '/data/bloc/bloc.dart';
import '../../widgets/crud.dart';

class ObservationTypes extends StatefulWidget {
  const ObservationTypes({super.key});

  @override
  State<ObservationTypes> createState() => _ObservationTypesState();
}

class _ObservationTypesState extends State<ObservationTypes> {
  @override
  void initState() {
    super.initState();
    context.read<ObservationTypesBloc>().add(ObservationTypesRetrieved());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ObservationTypesBloc, ObservationTypesState>(
      builder: (context, state) {
        return Crud(
          description:
              'List of defined observation types. Types can be added or current ones edited from this screen.',
          entities: state.observationTypes,
        );
      },
    );
  }
}
