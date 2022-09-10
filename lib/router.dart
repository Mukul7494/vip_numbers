import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vip_number_app/screens/homepage.dart';
// import 'package:vip_number_app/screens/homepage.dart';
import 'package:vip_number_app/screens/onBoardingScreen.dart';
import 'package:vip_number_app/widget/bottomNavigationBar.dart';
import 'package:vip_number_app/widget/searchBar.dart';

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
      builder: (context, state) => BottomNavigation(),
      // routes: [],
    ),
    GoRoute(
      name: "searchPage",
      path: "/Search",
      pageBuilder: (context, state) => MaterialPage(child: SearchPage()),
    )
  ],
);
