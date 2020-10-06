import 'product.dart';
import 'package:flutter/material.dart';
import 'package:medicalshop/classes/shopping_cart.dart';

class ProductCartNode extends StatefulWidget {
  final Product _product;
  final Function _refresh;
  ProductCartNode(this._product, this._refresh);

  @override
  _ProductCartNodeState createState() => _ProductCartNodeState();
}

class _ProductCartNodeState extends State<ProductCartNode> {

  ShoppingCart _cart = ShoppingCart();

  _ProductCartNodeState();

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
          Image.asset("images/" + widget._product.image, width: 130, height: 130,),
          Padding(
            padding: EdgeInsets.only(top: 15.0),
            child: Container(
              width: 130.0,
              height: 150.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    widget._product.companyName,
                    overflow: TextOverflow.fade,
                    softWrap: false,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.0,
                    ),
                  ),
                  Text(
                    widget._product.productName,
                    overflow: TextOverflow.ellipsis,
                    softWrap: true,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                    maxLines: 2,
                  ),
                  Text(
                    widget._product.size,
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
                    widget._product.cost.toString() + " руб.",
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
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.clear),
                    iconSize: 25,
                    onPressed: () {
                      _cart.remove(widget._product);
                      widget._refresh();
                    },
                  )
                ],
              ),
              Spacer(),
              Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.remove),
                    iconSize: 25,
                    onPressed: () {
                      setState(() {
                        _cart.less(widget._product);
                      });
                    },
                  ),
                  Text(
                    _cart.getProductCount(widget._product).toString(),
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.add),
                    iconSize: 25,
                    onPressed: () {
                      setState(() {
                        _cart.more(widget._product);
                      });
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