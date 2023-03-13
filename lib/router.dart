import 'package:animated_sidebar/features/features.dart';
import 'package:go_router/go_router.dart';

import 'features/theme/data/repository/repository.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      redirect: (_, __) => '/dashboard',
    ),
    ...SidebarRepsitory.getItems()
        .map(
          (e) => GoRoute(
            path: '/${e.path}',
            pageBuilder: (context, state) => NoTransitionPage<void>(
              key: state.pageKey,
              child: Layout(
                body: e.body,
                title: e.label,
                selectedItemName: e.path,
              ),
            ),
          ),
        )
        .toList()
  ],
);
