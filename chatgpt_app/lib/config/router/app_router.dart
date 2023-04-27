import 'package:chatgpt_app/presentation/screens/screens.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  routes: [
    GoRoute(
      name: HomeScreen.name,
      path: '/',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      name: CompletitionsScreen.name,
      path: '/completitions',
      builder: (context, state) => const CompletitionsScreen(),
    )
  ],
);
