import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:teste_app/Common/MyRouters.dart';
import 'package:teste_app/Pages/NowPage.dart';

class ListaPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ListaPageState();
}

class ListaPageState extends State<ListaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ElevatedButton(
        child: Text("NowPage"),
        onPressed: () => {Navigator.pushNamed(context, ROUTE_NOW)},
      )),
    );
  }
}
