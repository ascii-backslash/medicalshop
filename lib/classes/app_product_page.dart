import 'package:flutter/material.dart';
import 'package:medicalshop/classes/favorite_icon_button.dart';
import 'package:medicalshop/classes/shopping_cart.dart';
import 'product.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AppProductPage extends StatelessWidget {

  final ShoppingCart _cart = ShoppingCart();

  final Product _product;
  final Function _refresh;
  AppProductPage(this._product, this._refresh);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: () {
            _refresh();
            Navigator.pop(context);
          },
        ),
        actions: [
          FavoriteIconButton(_product, Colors.white),
          IconButton(
            icon: Icon(Icons.add_shopping_cart),
            color: Colors.white,
            onPressed: () {
              _cart.add(_product);
              Fluttertoast.showToast(
                msg: "Товар добавлен в корзину!",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                backgroundColor: Colors.lightBlue,
                fontSize: 20.0,
              );
            },
          ),
        ],
      ),
      
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              child: Image.asset(
                "images/" + _product.image,
                height: 400.0,
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 15.0, top: 15.0),
              alignment: Alignment.centerLeft,
              child: Text(
                _product.productName + " (" + _product.companyName + ")",
                softWrap: true,
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 15.0, top: 10.0),
              alignment: Alignment.centerLeft,
              child: Row(
                children: [
                  Text(
                    _product.cost.toString() + " руб.",
                    style: TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.cyan,
                      decoration: TextDecoration.underline,
                      decorationStyle: TextDecorationStyle.dotted,
                    ),
                  ),
                  Text("   "),
                  Text(
                    (_product.cost + _product.cost * 0.05).toString() + " руб.",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 22.0,
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),
                ],
              )
            ),
            Container(
              padding: EdgeInsets.only(left: 15.0, top: 25.0),
              alignment: Alignment.centerLeft,
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "Размеры: ",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                        ),
                      ),
                      Text(
                        _product.size,
                        style: TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 15.0, top: 25.0),
              alignment: Alignment.centerLeft,
              child: Text(
                "Описание: ",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 15.0, top: 5.0, right: 5.0),
              child: Text(
                _product.description,
                softWrap: true,
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}