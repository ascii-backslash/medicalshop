
import 'package:medicalshop/classes/product.dart';

class ShoppingCart {
  static final ShoppingCart _shoppingCart = ShoppingCart._init();
  static List<Product> _products = List<Product>();

  factory ShoppingCart() {
    return _shoppingCart;
  }

  ShoppingCart._init();

  int itemCount() {
    return _products.length;
  }

  void add(Product item) {
    if (!_products.contains(item)) {
      _products.add(item);
    }
  }

  void remove(Product item) {
    if (_products.contains(item)) {
      int index = _products.indexOf(item);
      _products.removeAt(index);
    }
  }

  Product getItem(int index) {
    return _products[index];
  }
}