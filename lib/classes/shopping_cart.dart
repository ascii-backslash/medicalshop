
import 'package:medicalshop/classes/product.dart';

class ShoppingCart {
  static final ShoppingCart _shoppingCart = ShoppingCart._init();
  static List<_ProductCounter> _products = List<_ProductCounter>();

  factory ShoppingCart() {
    return _shoppingCart;
  }

  ShoppingCart._init();

  //  Служебный метод для заполнения карточками ListView
  int itemCount() {
    return _products.length;
  }

  void add(Product item) {
    int index = _products.indexWhere((element) => element.product == item);
    if (index == -1) {
      _products.add(_ProductCounter(item));
    } else {
      _products[index].more();
    }
  }

  void more(Product item) => add(item);

  void less(Product item) {
    int index = _products.indexWhere((element) => element.product == item);
    if (index != -1) {
      _products[index].less();
    }
  }

  void remove(Product item) {
    int index = _products.indexWhere((element) => element.product == item);
    if (index != -1) {
      _products.removeAt(index);
    }
  }

  Product getProduct(int index) {
    return _products[index].product;
  }

  int getProductCount(Product item) {
    int index = _products.indexWhere((element) => element.product == item);
    if (index == -1) {
      return null;
    } else {
      return _products[index].count;
    }
  }

  double fullPrice() {
    double price = 0.0;
    _products.forEach((element) {
      price += element.product.cost * element.count.toDouble();
    });
    return price;
  }
}

// Обёртка класса Product для ведения счёта товара в корзине
class _ProductCounter {

  final Product _product;
  int _count;

  _ProductCounter(this._product) {
    _count = 1;
  }

  Product get product => _product;
  int get count => _count;

  void more() { if (_count < 100) _count++; }
  void less() { if (_count > 1) _count--; }
}