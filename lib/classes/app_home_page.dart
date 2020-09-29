//  Класс главной страницы приложения.

import 'package:medicalshop/classes/app_product_page.dart';

import 'product.dart';
import 'dart:convert';
import 'app_cart_page.dart';
import 'product_list_node.dart';
import 'package:flutter/material.dart';

class AppHomePage extends StatefulWidget {
  @override
  AppHomePageState createState() => AppHomePageState();
}

class AppHomePageState extends State<AppHomePage> {

  @override
  Widget build(BuildContext context) {

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
      body: FutureBuilder(
        future: DefaultAssetBundle.of(context).loadString("assets/products.json"),
        builder: (context, snapshot) {
          List<dynamic> data = json.decode(snapshot.data);
          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              Product _product = Product.fromJson(data[index]);
              return GestureDetector(
                child: ProductListNode(_product),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return AppProductPage(_product, null);
                      }
                    ),
                  );
                },
              );
            }
          );
        },
      ),
    );
  }
}