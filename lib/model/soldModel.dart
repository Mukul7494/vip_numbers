// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final soldProvider = ChangeNotifierProvider((ref) => SoldProvider());

class SoldModel {
  int? id;
  int? number;
  int? price;
  String filter;

  SoldModel(
      {required this.id,
      required this.number,
      required this.price,
      this.filter = ''});
}

class SoldProvider extends ChangeNotifier {
  final List<SoldModel> _sold = [];

  List<SoldModel> get cart => _sold;

  void addNumber(int id, int number, int price, String filter) {
    _sold.add(SoldModel(id: id, number: number, price: price));

    notifyListeners();
  }
}
