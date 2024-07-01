import 'package:flutter/material.dart';
import 'coffee.dart';

class CoffeeShop extends ChangeNotifier{

  final List <Coffee> _shop = [
    Coffee(
        name: 'Regular',
        price: "4.00",
        imagePath: "lib/images/coffee.png"
    ),
    Coffee(
        name: 'Iced Coffee',
        price: "4.10",
        imagePath: "lib/images/iced_coffee.png"
    ),
    Coffee(
        name: 'Cappuccino',
        price: "4.50",
        imagePath: "lib/images/cappuccino.png"
    ),
    Coffee(
        name: 'Latte',
        price: "4.50",
        imagePath: "lib/images/latte-art.png"
    ),
    Coffee(
        name: 'Expresso',
        price: "5.00",
        imagePath: "lib/images/expresso.png"
    ),
    Coffee(
        name: 'Mocha',
        price: "5.30",
        imagePath: "lib/images/mocha.png"
    ),
    Coffee(
        name: 'Dalgona Coffee',
        price: "6.10",
        imagePath: "lib/images/dalgona.png"
    ),
  ];

  List <Coffee> _userCart = [];

  List <Coffee> get coffeeShop =>  _shop;
  List <Coffee> get userCart =>  _userCart;

  void addItemToCart(Coffee coffee) {
    _userCart.add(coffee);
    notifyListeners();
  }

  void removeItemFromCart (Coffee coffee){
    _userCart.remove(coffee);
    notifyListeners();
  }

  double calculateTotalPrice() {
    double totalPrice = 0;
    for (var coffee in _userCart) {
      totalPrice += double.parse(coffee.price);
    }
    return totalPrice;
  }
}