
import 'package:flutter/material.dart';
import 'package:medicalshop/classes/product_cart_node.dart';
import 'package:medicalshop/classes/shopping_cart.dart';

class AppCartPage extends StatefulWidget {
  @override
  _AppCartPageState createState() => _AppCartPageState();
}

class _AppCartPageState extends State<AppCartPage> {
  
  ShoppingCart _cart = ShoppingCart();

  void _refresh() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Корзина",
          style: TextStyle(
            fontWeight: FontWeight.bold,
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
        key: Key(_cart.itemCount().toString()),
        itemCount: _cart.itemCount(),
        itemBuilder: (context, index) {
          return ProductCartNode(_cart.getProduct(index), _refresh);
        },
      ),

      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: [
            Text(
              "Цена: " + _cart.fullPrice().toString() + " руб.",
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
            Spacer(),
            FlatButton(
              color: Colors.cyan,
              child: Text(
                "Купить",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.8,
                ),
              ),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}