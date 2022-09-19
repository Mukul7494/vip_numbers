import 'package:go_router/go_router.dart';
import 'package:vip_number_app/screens/login_screen.dart';
import 'package:vip_number_app/screens/onBoardingScreen.dart';
import 'package:vip_number_app/screens/signup_screen.dart';
import 'package:vip_number_app/widget/bottomNavigationBar.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      name: "onboarding",
      path: "/",
      builder: (context, state) => LoginScreen(),
    ),
    GoRoute(
      name: "home",
      path: "/home",
      builder: (context, state) => const BottomNavigation(),
    ),
    GoRoute(
      name: "Login",
      path: "/loginscreen",
      builder: (context, state) => LoginScreen(),
    ),
    GoRoute(
      name: "Signup",
      path: "/signupscreen",
      builder: (context, state) => SignupScreen(),
    ),
  ],
);
