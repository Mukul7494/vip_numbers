import 'dart:math';

import 'package:flutter/cupertino.dart';

import 'numberModel.dart';

class cartModel {
  int? id;
  int? number;
  int? price;
  String filter;

  cartModel(
      {required this.id,
      required this.number,
      required this.price,
      this.filter = ''});
}

class CartProvider extends ChangeNotifier {
  List _cart = [];

  List get cart => _cart;

  void addNumber(int id, int number, int price, String filter) {
    _cart.add(cartModel(id: id, number: number, price: price));
    print('lol');
    notifyListeners();
  }

  void removeNumber(int id) {
    _cart.removeWhere((index) => index.id == id);
    // remove(id);
    print("lolllll");
    notifyListeners();
  }
}
