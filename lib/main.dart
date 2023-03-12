import 'package:animated_sidebar/features/theme/bloc/theme_bloc.dart';
import 'package:animated_sidebar/features/theme/layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

void main() async {
  await setupHydratedLocalStorage();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: providersList,
      child: MaterialApp(
        title: 'ETA',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        home: const Layout(),
      ),
    );
  }
}

List<BlocProvider> providersList = [
  BlocProvider(
    create: (context) => ThemeBloc(),
  ),
];

setupHydratedLocalStorage() async {
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: HydratedStorage.webStorageDirectory,
  );
}
