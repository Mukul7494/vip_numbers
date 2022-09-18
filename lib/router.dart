import 'package:go_router/go_router.dart';
import 'package:vip_number_app/screens/login_screen.dart';
// import 'package:vip_number_app/screens/homepage.dart';
// import 'package:vip_number_app/screens/homepage.dart';
import 'package:vip_number_app/screens/onBoardingScreen.dart';
import 'package:vip_number_app/widget/bottomNavigationBar.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      name: "home",
      path: "/",
      builder: (context, state) => OnBoardingScreen(),
    ),
    GoRoute(
      name: "resultPage",
      path: "/home",
      builder: (context, state) => const BottomNavigation(),
      // routes: [],
    ),
  ],
);
