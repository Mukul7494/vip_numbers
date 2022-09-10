// import 'package:flutter/material.dart';
// import 'package:vip_number_app/screens/homepage.dart';
// import 'package:vip_number_app/screens/onBoardingScreen.dart';

// class BottomNavigation extends StatefulWidget {
//   BottomNavigation({Key? key}) : super(key: key);

//   @override
//   State<BottomNavigation> createState() => _BottomNavigation();
// }

// final screens = [
//   // HomePage(),
//   OnBoardingScreen(),
//   const Center(
//     child: Text(
//       "cart",
//       style: TextStyle(fontSize: 50),
//     ),
//   ),
//   const Center(
//     child: Text(
//       "Profile",
//       style: TextStyle(fontSize: 50),
//     ),
//   ),
// ];
// int _currentIndex = 0;

// class _BottomNavigation extends State<BottomNavigation> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: _currentIndex,
//         items: const [
//           BottomNavigationBarItem(
//               icon: Icon(Icons.home),
//               label: "Home",
//               backgroundColor: Colors.black),
//           BottomNavigationBarItem(icon: Icon(Icons.person), label: "Person"),
//           BottomNavigationBarItem(
//               icon: Icon(Icons.local_library_outlined), label: "Sold"),
//           BottomNavigationBarItem(
//               icon: Icon(Icons.shopping_cart), label: "Cart"),
//         ],
//         onTap: (index) {
//           setState(() {
//             _currentIndex = index;
//           });
//         },
//       ),
//       body: screens[_currentIndex],
//     );
//   }
// }
