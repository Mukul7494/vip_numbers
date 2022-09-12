import 'package:flutter/cupertino.dart';
import 'package:vip_number_app/model/numberModel.dart';

class CartModel {
  int? id;
  int? number;
  int? price;
  String filter;

  CartModel(
      {required this.id,
      required this.number,
      required this.price,
      this.filter = ''});
}

class CartProvider extends ChangeNotifier {
  List<CartModel> _cart = [];

  List<CartModel> get cart => _cart;

  void addNumber(int id, int number, int price, String filter) {
    _cart.add(CartModel(id: id, number: number, price: price));
    print(_cart.length);
    notifyListeners();
  }

  void removeNumber(int id) {
    _cart.removeWhere((index) => index.id == id);
    // remove(id);
    print(_cart.length);
    notifyListeners();
  }
}
