import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'classes/AppHomePage.dart';

void main() => runApp(Application());

//  Класс приложения. Служит для настройки стиля и запуска визуальной составляющей.
class Application extends StatelessWidget {
  //  Переопределяем метод build для класса приложения
  @override
  Widget build(BuildContext context) {
    //  Выключаем нижнюю панель управления, оставляя верхнюю.
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.top]);
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


