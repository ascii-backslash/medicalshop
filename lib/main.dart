import 'package:flutter/material.dart';
import 'package:medicalshop/DAL/favorite_products_base.dart';
import 'classes/app_home_page.dart';

void main() => runApp(Application());

//  Класс приложения. Служит для настройки стиля и запуска визуальной составляющей.
class Application extends StatelessWidget {
  //  Переопределяем метод build для класса приложения
  @override
  Widget build(BuildContext context) {
    //  Запускаем визуальную составляющую приложения в стиле Material.
    return MaterialApp(
      title: "Medical Shop",
      theme: ThemeData(
        primarySwatch: Colors.cyan,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: FutureBuilder(
        future: FavoriteProductsBase.initDb(),
        builder: (context, snapshot) {
          if (snapshot.data == null)
            return Scaffold(
              backgroundColor: Colors.cyan,
              body: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.clear_all,
                      color: Colors.white,
                      size: 60,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        "MEDSHOP",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 35,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );

          return AppHomePage();
        },
      ),
    );
  }
}


