import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vip_number_app/screens/homepage.dart';
// import 'package:vip_number_app/screens/homepage.dart';
import 'package:vip_number_app/screens/onBoardingScreen.dart';
import 'package:vip_number_app/widget/searchBar.dart';

final router = GoRouter(routes: [
  GoRoute(
    name: "home",
    path: "/",
    pageBuilder: (context, state) => MaterialPage(child: OnBoardingScreen()),
  ),
  GoRoute(
    name: "resultPage",
    path: "/home",
    pageBuilder: (context, state) => MaterialPage(child: HomePage()),
  ),
  GoRoute(
    name: "searchPage",
    path: "/Search",
    pageBuilder: (context, state) => MaterialPage(child: SearchPage()),
  )
]);
