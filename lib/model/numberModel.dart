import 'package:flutter/material.dart';

class Number {
  int number;
  int price;
  String? filter;
  Number({required this.number, required this.price, this.filter});
}

class NumberProvider extends ChangeNotifier {
  List<Number> _number = [
    //starting of 786 numbers
    Number(
      number: 7869265470,
      price: 5501,
      filter: '786',
    ),
    Number(
      number: 7869275736,
      price: 521,
      filter: '786',
    ),
    Number(
      number: 7869282927,
      price: 786,
      filter: '786',
    ),
    Number(
      number: 7869208268,
      price: 507,
      filter: '786',
    ),
    Number(
      number: 7269891786,
      price: 5601,
      filter: '786',
    ),

//ending

// starting of AB AB AB

    Number(
      number: 9805585858,
      price: 5201,
      filter: 'AB AB AB',
    ),

    Number(
      number: 7248848484,
      price: 561,
      filter: 'AB AB AB',
    ),

    Number(
      number: 7024989898,
      price: 5651,
      filter: 'AB AB AB',
    ),

    Number(
      number: 7439202020,
      price: 502,
      filter: 'AB AB AB',
    ),

    Number(
      number: 9083797979,
      price: 501,
      filter: 'AB AB AB',
    ),

//ending
    //starting of 12345
    Number(number: 8012345793, price: 5301, filter: '12345'),
    Number(number: 9506112345, price: 5041, filter: '12345'),
    Number(number: 8012345728, price: 5601, filter: '12345'),
    Number(number: 8012345397, price: 5701, filter: '12345'),
    Number(number: 9805123456, price: 5201, filter: '12345'),
//ending

// //starting of aaa bbb
//
    Number(
      number: 9997774851,
      price: 5601,
      filter: 'AAA BBB',
    ),

    Number(
      number: 9997776740,
      price: 5501,
      filter: 'AAA BBB',
    ),
    Number(
      number: 9993339062,
      price: 5301,
      filter: 'AAA BBB',
    ),
    Number(
      number: 9997774806,
      price: 5401,
      filter: 'AAA BBB',
    ),
    Number(
      number: 9997775780,
      price: 511,
      filter: 'AAA BBB',
    ),
// ending

// //starting of ABC ABC
    Number(
      number: 9589580060,
      price: 5021,
      filter: 'ABC ABC',
    ),
    Number(
      number: 9669660031,
      price: 4001,
      filter: 'ABC ABC',
    ),
    Number(
      number: 8268264477,
      price: 201,
      filter: 'ABC ABC',
    ),
    Number(
      number: 9839830630,
      price: 501,
      filter: 'ABC ABC',
    ),
    Number(
      number: 9559554054,
      price: 500,
      filter: 'ABC ABC',
    ),
//ending
  ];
  List<Number> get getNumber => _number;
}



// class NumberProvider extends ChangeNotifier {
//   bool onClicked = false;
//   final _number = const [
//     //starting of 786 numbers
//     {
//       'number': 7869265470,
//       'price': 5501,
//       'filter': '786',
//     },
//     {
//       'number': 7869275736,
//       'price': 521,
//       'filter': '786',
//     },
//     {
//       'number': 7869282927,
//       'price': 786,
//       'filter': '786',
//     },
//     {
//       'number': 7869208268,
//       'price': 507,
//       'filter': '786',
//     },
//     {
//       'number': 7269891786,
//       'price': 5601,
//       'filter': '786',
//     },

// //ending

// // starting of AB AB AB
//     {
//       'number': 9805585858,
//       'price': 5201,
//       'filter': 'AB AB AB',
//     },
//     {
//       'number': 7248848484,
//       'price': 561,
//       'filter': 'AB AB AB',
//     },
//     {
//       'number': 7024989898,
//       'price': 5651,
//       'filter': 'AB AB AB',
//     },
//     {
//       'number': 7439202020,
//       'price': 502,
//       'filter': 'AB AB AB',
//     },
//     {
//       'number': 9083797979,
//       'price': 501,
//       'filter': 'AB AB AB',
//     },

// //ending
//     //starting of 12345
//     {'number': 9506112345, 'price': 5041, 'filter': '12345'},
//     {'number': 8012345793, 'price': 5301, 'filter': '12345'},
//     {'number': 8012345728, 'price': 5601, 'filter': '12345'},
//     {'number': 8012345397, 'price': 5701, 'filter': '12345'},
//     {'number': 9805123456, 'price': 5201, 'filter': '12345'},
// //ending

// //starting of aaa bbb
//     {
//       'number': 9997774851,
//       'price': 5601,
//       'filter': 'AAA BBB',
//     },
//     {
//       'number': 9997776740,
//       'price': 5501,
//       'filter': 'AAA BBB',
//     },
//     {
//       'number': 9993339062,
//       'price': 5301,
//       'filter': 'AAA BBB',
//     },
//     {
//       'number': 9997774806,
//       'price': 5401,
//       'filter': 'AAA BBB',
//     },
//     {
//       'number': 9997775780,
//       'price': 511,
//       'filter': 'AAA BBB',
//     },
// // ending

// //starting of ABC ABC
//     {
//       'number': 9589580060,
//       'price': 5021,
//       'filter': 'ABC ABC',
//     },
//     {
//       'number': 9669660031,
//       'price': 4001,
//       'filter': 'ABC ABC',
//     },
//     {
//       'number': 8268264477,
//       'price': 201,
//       'filter': 'ABC ABC',
//     },
//     {
//       'number': 9839830630,
//       'price': 501,
//       'filter': 'ABC ABC',
//     },
//     {
//       'number': 9559554054,
//       'price': 500,
//       'filter': 'ABC ABC',
//     },
// //ending
//   ];
//   get number => _number;
//   get toCart => _number.where((element) => onClicked == true).toList();

//   bool toggleNumberStatus(NumberProvider number) {
//     onClicked = !onClicked;
//     notifyListeners();
//     return onClicked;
//   }
// }
