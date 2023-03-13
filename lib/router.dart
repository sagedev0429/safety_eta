import 'package:animated_sidebar/features/administration/masters/regions/regions.dart';
import 'package:go_router/go_router.dart';
import 'features/theme/data/repository/repository.dart';

final GoRouter router = GoRouter(
  routes: SidebarRepsitory.getItems()
      .map((e) => GoRoute(
            path: '/${e.path}',
            builder: (context, state) => e.body,
          ))
      .toList()
    ..add(
      GoRoute(
        path: '/',
        builder: (context, state) => const Regions(),
      ),
    ),
);
