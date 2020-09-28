
import 'package:flutter/material.dart';
import 'package:medicalshop/classes/product_cart_node.dart';
import 'package:medicalshop/classes/shopping_cart.dart';

class AppCartPage extends StatefulWidget {
  @override
  _AppCartPageState createState() => _AppCartPageState();
}

class _AppCartPageState extends State<AppCartPage> {
  
  ShoppingCart _cart = ShoppingCart();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Корзина",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            wordSpacing: 1.5,
            color: Colors.white,
            fontSize: 25,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),

      body: ListView.builder(
        itemCount: _cart.itemCount(),
        itemBuilder: (context, index) {
          return ProductCartNode(_cart.getItem(index));
        },
      ),
    );
  }
}