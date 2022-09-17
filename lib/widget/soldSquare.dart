import 'package:flutter/material.dart';

class SoldSquare extends StatefulWidget {
  final int price;
  final int number;
  final String? filter;
  final int? id;
  // final int? index;
  // ignore: use_key_in_widget_constructors
  const SoldSquare({
    required this.price,
    required this.number,
    this.filter,
    required this.id,
  });

  @override
  State<SoldSquare> createState() => _SoldSquareState();
}

class _SoldSquareState extends State<SoldSquare> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color.fromARGB(219, 155, 39, 176),
      ),
      margin: const EdgeInsets.only(bottom: 2, top: 2),
      height: 100,
      child: Column(
        children: [
          Container(
            // decoration: BoxDecoration(
            //   color: Colors.black,
            //   borderRadius: BorderRadius.circular(10),
            // ),
            margin: const EdgeInsets.only(top: 3),
            padding: const EdgeInsets.all(3),
            width: double.infinity,
            height: 25,
            child: Text(
              "₹ ${widget.price}",
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(10),
            ),
            width: double.infinity,
            height: 1,
          ),
          Container(
            padding: const EdgeInsets.only(top: 3, bottom: 3, left: 10),
            height: 40,
            width: double.infinity,
            color: Colors.blue,
            child: Text(
              widget.number.toString(),
              style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(10),
            ),
            width: double.infinity,
            height: 1,
          ),
          const Center(
            child: Text(
              "Sum=100",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
            ),
          ),
        ],
      ),
    );
  }
}
