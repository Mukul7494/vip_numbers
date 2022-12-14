import 'package:flutter/material.dart';

class Square extends StatelessWidget {
  final int price;
  final int number;
  final String? filter;
  Square({required this.price, required this.number, this.filter});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color.fromARGB(219, 155, 39, 176),
      ),
      margin: EdgeInsets.only(bottom: 2, top: 2),
      height: 150,
      child: Column(
        children: [
          Container(
            // decoration: BoxDecoration(
            //   color: Colors.black,
            //   borderRadius: BorderRadius.circular(10),
            // ),
            margin: EdgeInsets.only(top: 3),
            padding: EdgeInsets.all(3),
            width: double.infinity,
            height: 25,
            child: Text(
              "₹ ${price}",
              style: TextStyle(
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
            height: 2,
          ),
          Container(
            padding: EdgeInsets.only(top: 3, bottom: 3, left: 10),
            height: 40,
            width: double.infinity,
            color: Colors.blue,
            child: Text(
              number.toString(),
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(10),
            ),
            width: double.infinity,
            height: 2,
          ),
          Center(
            child: Text(
              "Sum=100",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
            ),
          ),
          Center(
            child: ElevatedButton(
              child: Text("Add to Cart"),
              onPressed: () {},
            ),
          )
        ],
      ),
    );
  }
}
