import 'package:flutter/material.dart';


class CartModel extends ChangeNotifier{
  final List _shopItems = [
    ["Latte", "4.00", "images/Latte.png", Colors.green],
    ["Espresso", "2.45", "images/Espresso.png", Colors.yellow],
    ["Cold Coffee", "12.90", "images/ColdCoffee.png", Colors.brown],
    ["Black Coffee", "1.00", "images/BlackCoffee.png", Colors.blue],
    
  ];
// list of card

List _cartItems = [];

get shopItems => _shopItems;



  get cartItems => _cartItems;

  //add item to the cart
  void addItemToCart(int index){
    _cartItems.add(_shopItems[index]);
    notifyListeners();
  }

  //remove item from the cart

  removeItemFromCart(int index){
    _cartItems.remove(index);
    notifyListeners();

  }

  //calculate total price

  String calculateTotal(){
    double totalPrice = 0;
    for(int i =0; i<_cartItems.length; i++){
      totalPrice += double.parse(_cartItems[i][1]);
    };
    return totalPrice.toStringAsExponential(2);
  }
}