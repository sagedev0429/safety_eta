import 'package:animated_sidebar/features/administration/masters/regions/bloc/regions_bloc.dart';
import 'package:animated_sidebar/features/administration/masters/widgets/crud.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Regions extends StatefulWidget {
  const Regions({super.key});

  @override
  State<Regions> createState() => _RegionsState();
}

class _RegionsState extends State<Regions> {
  @override
  void initState() {
    super.initState();
    context.read<RegionsBloc>().add(RegionsRetrieved());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegionsBloc, RegionsState>(
      builder: (context, state) {
        return Crud(
          description: 'The following regions are available to create sites in',
          entities: state.regions,
        );
      },
    );
  }
}
