import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:vip_number_app/model/numberModel.dart';
import 'package:vip_number_app/screens/cart.dart';

import '../model/numberModel.dart';

// import '../model/cartModel.dart';

class Square extends StatefulWidget {
  final int price;
  final int number;
  final String? filter;
  final int? index;
  // ignore: use_key_in_widget_constructors
  const Square(
      {required this.price, required this.number, this.filter, this.index});

  @override
  State<Square> createState() => _SquareState();
}

class _SquareState extends State<Square> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color.fromARGB(219, 155, 39, 176),
      ),
      margin: const EdgeInsets.only(bottom: 2, top: 2),
      height: 150,
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
            height: 2,
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
            height: 2,
          ),
          const Center(
            child: Text(
              "Sum=100",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
            ),
          ),
          Consumer(
            builder: (context, ref, child) {
              return Center(
                child: ElevatedButton(
                  child: const Text("Add to Cart"),
                  onPressed: () {
                    // final numberProvider = Provider((ref) => NumberProvider());
                    // ignore: deprecated_member_use
                    Scaffold.of(context).showSnackBar(const SnackBar(
                      content: Text('Your Number Added to cart'),
                      duration: Duration(seconds: 1),
                    ));
                    final number1 = ref.watch(numberProvider);
                    final provider = ref.watch(cartProvider1);
                    provider.addNumber(
                        number1.getNumber.elementAt(widget.index!).id,
                        number1.getNumber.elementAt(widget.index!).number,
                        number1.getNumber.elementAt(widget.index!).price,
                        number1.getNumber.elementAt(widget.index!).filter);
                    setState(() {
                      number1.removeNumber(
                          number1.getNumber.elementAt(widget.index!).id);
                    });
                  },
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
