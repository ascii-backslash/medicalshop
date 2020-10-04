//  Класс главной страницы приложения.

import 'product.dart';
import 'dart:convert';
import 'app_cart_page.dart';
import 'product_list_node.dart';
import 'package:flutter/material.dart';
import 'package:medicalshop/classes/app_product_page.dart';

class AppHomePage extends StatefulWidget {
  @override
  AppHomePageState createState() => AppHomePageState();
}

class AppHomePageState extends State<AppHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Icon(
              Icons.clear_all,
              color: Colors.white,
              size: 40,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                "MEDSHOP",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            color: Colors.white,
            iconSize: 28,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return AppCartPage();
                }),
              );
            },
          ),
        ],
      ),
      body: FutureBuilder(
        future: DefaultAssetBundle.of(context).loadString("assets/products.json"),
        builder: (context, snapshot) {
          List<dynamic> data =
              snapshot.data == null ? [] : json.decode(snapshot.data);
          if (snapshot.data == null) {
            return Center(child: CircularProgressIndicator());
          }
          return ListView.builder(
            key: Key(data.length.toString()),
            itemCount: data.length,
            itemBuilder: (context, index) {
              Product _product = Product.fromJson(data[index]);
              return GestureDetector(
                child: ProductListNode(_product, refresh),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return AppProductPage(_product, refresh);
                      },
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }

  void refresh() {
    setState(() {});
  }
}