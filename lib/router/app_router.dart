import 'package:go_router/go_router.dart';
import '../core/presentation/main_layout.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const MainLayout(),
    ),
  ],
);
