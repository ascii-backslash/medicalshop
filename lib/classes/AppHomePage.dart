//  Класс главной страницы приложения.

import 'package:flutter/material.dart';
import 'package:medicalshop/classes/Product.dart';
import 'ProductListNode.dart';
import 'HomeAppBar.dart';

class AppHomePage extends StatefulWidget {
  @override
  AppHomePageState createState() => AppHomePageState();
}

class AppHomePageState extends State<AppHomePage> {
  //  На начальной стадии разработки будем явно инициализировать все объекты класса
  //  Product и, соответственно, узлов ListView, без загрузки из "вне".

  List<Product> products = [
    Product(0, "iFlex", "Медицинский костюм", "", "", "XS/S/M/L/XL/XXL", "pic2.jpg", 6500.0),
    Product(1, "Cherokee", "Медицинская шапка", "", "", "OS", "pic7.jpg", 1000.0),
    Product(2, "Dickies", "Медицинский комбинезон", "", "", "XS/S/M/L/XL/XXL", "pic6.jpg", 7300.0),
    Product(3, "Poison Atelier", "Медицинское платье", "", "", "XS/S/M/L/XL/XXL", "pic8.jpg", 4980.0),
    Product(4, "Dickies Balance", "Медицинская куртка", "", "", "XS/S/M/L/XL/XXL", "pic5.jpg", 4000.0),
    Product(5, "Cherokee Infinity", "Медицинский жакет", "", "", "XS/S/M/L/XL/XXL", "pic4.jpg", 4500.0),
    Product(6, "Cherokee", "Медицинский халат", "", "", "XS/S/M/L/XL/XXL", "pic1.jpg", 3200.0),
    Product(7, "Cherokee WW Revolution", "Медицинские брюки", "", "", "XS/S/M/L/XL/XXL", "pic9.jpg", 1500.0),
    Product(8, "Cherokee Infinity", "Медицинский топ", "", "", "XS/S/M/L/XL/XXL", "pic3.jpg", 3600.0),
    Product(9, "БРОШ", "Сердце океана", "", "", "Нет размера", "pic10.jpg", 800.0),
  ];

  @override
  Widget build(BuildContext context) {
    ListView listView = ListView(
      children: [
        ProductListNode(products[0]),
        ProductListNode(products[1]),
        ProductListNode(products[2]),
        ProductListNode(products[3]),
        ProductListNode(products[4]),
        ProductListNode(products[5]),
        ProductListNode(products[6]),
        ProductListNode(products[7]),
        ProductListNode(products[8]),
        ProductListNode(products[9]),
      ],
    );

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: TabBarView(
          children: [
            Center(
              child: Scaffold(
                backgroundColor: Colors.grey.withAlpha(10),
                appBar: HomeAppBar(),
                body: listView,
              ),
            ),
            Center(
              child: Icon(Icons.shopping_cart),
            ),
            Center(
              child: Icon(Icons.account_box),
            )
          ],
        ),
        bottomNavigationBar: TabBar(
          unselectedLabelColor: Colors.cyan,
          tabs: [
            Tab(icon: Icon(Icons.home)),
            Tab(icon: Icon(Icons.shopping_cart)),
            Tab(icon: Icon(Icons.account_box)),
          ],
        ),
      ),
    );
  }
}