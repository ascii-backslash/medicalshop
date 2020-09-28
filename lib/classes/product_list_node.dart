//  Класс плитки в ListView.

import 'product.dart';
import 'package:flutter/material.dart';
import 'shopping_cart.dart';

class ProductListNode extends StatelessWidget {

  final ShoppingCart _cart = ShoppingCart();

  final Product _product;
  ProductListNode(this._product);

  @override
  Widget build(BuildContext context) {
    return Container(
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
          Image.asset("images/" + _product.image, width: 130, height: 130,),
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
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.0,
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
                    _product.cost.toString() + " руб.",
                    overflow: TextOverflow.fade,
                    softWrap: false,
                    style: TextStyle(
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
                  IconButton(
                    icon: Icon(Icons.favorite_border),
                    iconSize: 25,
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(Icons.add_shopping_cart),
                    iconSize: 25,
                    onPressed: () {
                      _cart.add(_product);
                    },
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}