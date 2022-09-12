import 'package:flutter/material.dart';
import 'package:vip_number_app/screens/cart.dart';
import 'package:vip_number_app/screens/homepage.dart';
import 'package:vip_number_app/screens/soldScreen.dart';
// import 'package:vip_number_app/screens/onBoardingScreen.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  State<BottomNavigation> createState() => _BottomNavigation();
}

final screens = [
  const HomePage(),
  const Center(
    child: Text(
      "Profile",
      style: TextStyle(fontSize: 50),
    ),
  ),
  SoldScreen(),
  const Cart(),
];
int _currentIndex = 0;

class _BottomNavigation extends State<BottomNavigation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        currentIndex: _currentIndex,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
              backgroundColor: Colors.black),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Person"),
          BottomNavigationBarItem(
              icon: Icon(Icons.local_library_outlined), label: "Sold"),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart), label: "Cart"),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      body: screens[_currentIndex],
    );
  }
}
