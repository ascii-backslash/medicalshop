import 'package:flutter/material.dart';
import 'package:medicalshop/DAL/favorite_products_base.dart';
import 'classes/app_home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FavoriteProductsBase.initDb();
  runApp(Application());
}

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
      home: AppHomePage(),
    );
  }
}


