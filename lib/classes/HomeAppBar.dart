//  Это файл класса, реализующего стиль виджета AppBar под данное приложение.
//  Не имеет никакой логики, кроме стилистических настроек.

import 'package:flutter/material.dart';
import 'AppHomePage.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  final AppBar _appBar = AppBar(
    centerTitle: true,
    title: Container(
      margin: EdgeInsets.only(top: 16.0, bottom: 8.0),
      child: Text(
        "MEDSHOP",
        style: TextStyle(
          color: Colors.white,
          fontSize: 26,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
    bottom: PreferredSize(
      preferredSize: Size(0, 60),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              margin: EdgeInsets.fromLTRB(12.0, 0.0, 5.0, 13.0),
              height: 38,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(18.0)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withAlpha(30),
                    blurRadius: 10.0,
                  ),
                ],
              ),
              child: TextField(
                cursorColor: Colors.amberAccent,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ),
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.white, width: 1.0
                    ),
                    borderRadius:
                    BorderRadius.all(Radius.circular(18.0)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.white, width: 1.0
                    ),
                    borderRadius:
                    BorderRadius.all(Radius.circular(18.0)),
                  ),
                  contentPadding: EdgeInsets.all(10.0),
                  labelStyle: TextStyle(
                    fontSize: 15,
                    color: Colors.blueGrey,
                    fontWeight: FontWeight.bold,
                  ),
                  labelText: "Поиск...",
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                ),
              ),
            ),
          ),
          IconButton(
            padding:
            const EdgeInsets.fromLTRB(9.0, 0.0, 18.0, 17.0),
            color: Colors.white,
            iconSize: 30,
            icon: Icon(Icons.search),
            onPressed: () { },
          ),
        ],
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return _appBar;
  }

  @override
  Size get preferredSize => new Size.fromHeight(_appBar.preferredSize.height);

}