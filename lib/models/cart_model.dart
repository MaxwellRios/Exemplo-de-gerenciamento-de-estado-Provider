import 'package:flutter/material.dart';

class CartModel extends ChangeNotifier {
  final List _shopItems = [
    ['Sundae de Morange', '10.50', 'lib/images/5.png', Colors.green],
    ['Banana Split', '12.50', 'lib/images/3.png', Colors.amber],
    ['Sorvete', '11.50', 'lib/images/4.png', Colors.brown],
    ['Cupcake', '14.00', 'lib/images/2.png', Colors.blue],
    ['Donut Morango', '6.00', 'lib/images/rosquinha (2).png', Colors.orange],
    ['Donut Napolitano', '11.00', 'lib/images/rosquinha (1).png', Colors.cyan],
  ];

  //list of cart items
  final List _cartItems = [];

  get shopItems => _shopItems;

  get cartItems => _cartItems;

  void addItemtoCart(int index) {
    _cartItems.add(_shopItems[index]);
    notifyListeners();
  }

  void removeItemFromCart(int index) {
    _cartItems.removeAt(index);
    notifyListeners();
  }

  String CalculateTotal() {
    double totalPrice = 0;

    for (var i = 0; i < _cartItems.length; i++) {
      totalPrice += double.parse(_cartItems[i][1]);
    }
    return totalPrice.toStringAsFixed(2);
  }
}
