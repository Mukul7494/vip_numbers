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
  const SoldScreen(),
  const Cart(),
];
int _currentIndex = 0;

class _BottomNavigation extends State<BottomNavigation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Colors.black,
        currentIndex: _currentIndex,
        items: const [
          BottomNavigationBarItem(
            backgroundColor: Colors.deepOrange,
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Person",
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_library_outlined),
            label: "Sold",
            backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: "Cart",
            backgroundColor: Colors.green,
          ),
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
