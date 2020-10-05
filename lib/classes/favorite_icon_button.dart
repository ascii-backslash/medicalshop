import 'product.dart';
import 'package:flutter/material.dart';
import 'package:medicalshop/DAL/favorite_products_base.dart';

class FavoriteIconButton extends StatefulWidget {
  final Color _color;
  final Product _product;
  FavoriteIconButton(this._product, this._color);

  @override
  _FavoriteIconButtonState createState() => _FavoriteIconButtonState();
}

class _FavoriteIconButtonState extends State<FavoriteIconButton> {

  _FavoriteIconButtonState();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: FavoriteProductsBase.isProductLiked(widget._product.id),
      builder: (context, snapshot) {
        bool isLiked = snapshot.data;

        if (isLiked == null)
          return IconButton(
            icon: Icon(Icons.favorite),
            color: Colors.cyan,
          );

        return IconButton(
          icon: Icon(isLiked ? Icons.favorite : Icons.favorite_border),
          iconSize: 25,
          color: widget._color == null ? Colors.cyan : widget._color,
          onPressed: () {
            FavoriteProductsBase.changeLiked(widget._product.id).then((future) => setState(() {}));
          },
        );
      }
    );
  }
}