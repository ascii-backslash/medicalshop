import 'product.dart';
import 'package:flutter/material.dart';
import 'package:medicalshop/DAL/favorite_products_base.dart';

class FavoriteIconButton extends StatefulWidget {
  final Color _color;
  final Product _product;
  final Function _refresh;
  FavoriteIconButton(this._product, this._color, this._refresh);

  @override
  _FavoriteIconButtonState createState() => _FavoriteIconButtonState(_product, _color, _refresh);
}

class _FavoriteIconButtonState extends State<FavoriteIconButton> {
  final Color _color;
  final Product _product;
  final Function _refresh;

  _FavoriteIconButtonState(this._product, this._color, this._refresh);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: FavoriteProductsBase.access.isProductLiked(_product.id),
      builder: (context, snapshot) {
        Icon _icon;
        Color _putColor = _color == null ? Colors.cyan : _color;

        bool isLiked = snapshot.data;

        if (isLiked == null)
          return IconButton(
            icon: Icon(Icons.favorite),
            color: Colors.cyan,
          );

        switch(isLiked) {
          case true:
              _icon = Icon(Icons.favorite);
            break;
          case false:
              _icon = Icon(Icons.favorite_border);
            break;
        }

        return IconButton(
          icon: _icon,
          iconSize: 25,
          color: _putColor,
          onPressed: () {
            setState(() {
              FavoriteProductsBase.access.changeLiked(_product.id);
            });
            _refresh();
          },
        );
      }
    );
  }
}