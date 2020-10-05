//  Класс плитки в ListView.

import 'product.dart';
import 'shopping_cart.dart';
import 'favorite_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:medicalshop/classes/app_product_page.dart';

class ProductListNode extends StatelessWidget {
  final ShoppingCart _cart = ShoppingCart();

  final Product _product;

  ProductListNode(this._product);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: Container(
          height: 150,
          margin: EdgeInsets.symmetric(vertical: 4.0, horizontal: 5.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(13.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withAlpha(40),
                blurRadius: 5.0,
              ),
            ],
            color: Colors.white,
          ),
          child: Row(
            children: [
              Image.asset(
                "images/" + _product.image,
                width: 130,
                height: 130,
              ),
              Padding(
                padding: EdgeInsets.only(top: 15.0),
                child: Container(
                  width: 150.0,
                  height: 150.0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        _product.companyName,
                        overflow: TextOverflow.fade,
                        softWrap: false,
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black.withAlpha(200),
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.2,
                        ),
                      ),
                      Text(
                        _product.productName,
                        overflow: TextOverflow.ellipsis,
                        softWrap: true,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                        maxLines: 2,
                      ),
                      Text(
                        _product.size,
                        overflow: TextOverflow.fade,
                        softWrap: false,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                        maxLines: 1,
                      ),
                      Text(""),
                      Text(
                        _product.cost.truncate().toString() + " руб.",
                        overflow: TextOverflow.fade,
                        softWrap: false,
                        style: TextStyle(
                          color: Colors.cyan.withAlpha(180),
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      FavoriteIconButton(_product, null),
                      IconButton(
                        icon: Icon(Icons.add_shopping_cart),
                        iconSize: 25,
                        color: Colors.cyan,
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
                ],
              ),
            ],
          ),
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) {
              return AppProductPage(_product);
            }),
          );
        });
  }
}
