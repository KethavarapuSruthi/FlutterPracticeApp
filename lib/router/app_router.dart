import 'package:go_router/go_router.dart';

import '../views/user_screen.dart';
import '../views/user_details_screen.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const UserScreen(),
    ),
    GoRoute(
      path: '/details',
      builder: (context, state) => const UserDetailsScreen(),
    )
  ]
);