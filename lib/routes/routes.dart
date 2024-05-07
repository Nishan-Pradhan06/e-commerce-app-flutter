
import 'package:go_router/go_router.dart';
import '../views/pages/admin/admin_home.dart';
import '../views/pages/auth/signin.dart';
import '../views/pages/auth/signup.dart';
import '../views/pages/onboarding/getting_start.dart';
import '../views/pages/onboarding/onboarding_pages.dart';
import '../views/pages/user/user_pages.dart';

final GoRouter _goRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => UserDashboard() ,
    ),
    GoRoute(
      path: '/adminDashboard',
      builder: (context, state) => AdminHome() ,
    ),
    GoRoute(
      path: '/onBoarding',
      builder: (context, state) => OnBoarding() ,
    ),
    GoRoute(
      path: '/gettingStart',
      builder: (context, state) => GettingStart() ,
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => LoginPage() ,
    ),
    GoRoute(
      path: '/signup',
      builder: (context, state) => SignUp() ,
    ),
  ],
);
