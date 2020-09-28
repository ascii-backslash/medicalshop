//  Класс главной страницы приложения.

import 'product.dart';
import 'app_cart_page.dart';
import 'app_product_page.dart';
import 'product_list_node.dart';
import 'package:flutter/material.dart';
import 'package:medicalshop/others/description_products.dart';

class AppHomePage extends StatefulWidget {
  @override
  AppHomePageState createState() => AppHomePageState();
}

class AppHomePageState extends State<AppHomePage> {

  List<Product> products = [
    Product(0, "iFlex", "Медицинский костюм", des2, "", "XS/S/M/L/XL/XXL", "pic2.jpg", 6500.0),
    Product(1, "Cherokee", "Медицинская шапка", des7, "", "OS", "pic7.jpg", 1000.0),
    Product(2, "Dickies", "Медицинский комбинезон", des6, "", "XS/S/M/L/XL/XXL", "pic6.jpg", 7300.0),
    Product(3, "Poison Atelier", "Медицинское платье", des8, "", "XS/S/M/L/XL/XXL", "pic8.jpg", 4980.0),
    Product(4, "Dickies Balance", "Медицинская куртка", des5, "", "XS/S/M/L/XL/XXL", "pic5.jpg", 4000.0),
    Product(5, "Cherokee Infinity", "Медицинский жакет", des4, "", "XS/S/M/L/XL/XXL", "pic4.jpg", 4500.0),
    Product(6, "Cherokee", "Медицинский халат", des1, "", "XS/S/M/L/XL/XXL", "pic1.jpg", 3200.0),
    Product(7, "Cherokee WW Revolution", "Медицинские брюки", des9, "", "XS/S/M/L/XL/XXL", "pic9.jpg", 1500.0),
    Product(8, "Cherokee Infinity", "Медицинский топ", des3, "", "XS/S/M/L/XL/XXL", "pic3.jpg", 3600.0),
    Product(9, "БРОШ", "Сердце океана", des10, "", "Нет размера", "pic10.jpg", 800.0),
  ];

  @override
  Widget build(BuildContext context) {

    ListView listView = ListView.builder(
      itemCount: products.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          child: ProductListNode(products[index]),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return AppProductPage(products[index], null);
                }
              ),
            );
          },
        );
      },
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "MEDSHOP",
          style: TextStyle(
            color: Colors.white,
            wordSpacing: 1.5,
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            color: Colors.white,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return AppCartPage();
                  }
                ),
              );
            },
          ),
        ],
      ),

      body: listView,
    );
  }
}