import 'package:go_router/go_router.dart';
import 'package:weather_checking/features/auth/presentation/screens/login_screen.dart';
import 'package:weather_checking/features/dashboard/presentation/screens/dashboard_screen.dart';
import 'package:weather_checking/routing/routes_strings.dart';

final router = GoRouter(initialLocation: RoutesStrings.login, routes: [
  GoRoute(
    name: RoutesStrings.login,
    path: RoutesStrings.login,
    builder: (context, state) => const LoginScreen(),
    routes: [],
  ),
  GoRoute(
    name: RoutesStrings.mainScreen,
    path: RoutesStrings.mainScreen,
    builder: (context, state) => DashboardScreen(
      name: state.pathParameters['userName'] as String,
    ),
  )
]);
