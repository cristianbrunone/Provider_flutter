import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:teste_app/Pages/ListaPage.dart';
import 'package:teste_app/Pages/MyLoginScreen.dart';
import 'package:teste_app/Pages/NowPage.dart';

const String ROUTE_HOME = "/home";
const String ROUTE_LOGIN = "/login";
const String ROUTE_LISTA = "/lista";
const String ROUTE_NOW = "/now";

class MyRouters {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      /*case "/home":
        return CupertinoPageRoute(builder: (_) => MyHomePage());*/
      case "/login":
        return CupertinoPageRoute(builder: (_) => MyLoginScreen());
      case "/lista":
        return CupertinoPageRoute(builder: (_) => ListaPage());
      case "/now":
        return CupertinoPageRoute(builder: (_) => NowPage());
      default:
        return CupertinoPageRoute(builder: (_) => MyLoginScreen());
    }
  }
}
