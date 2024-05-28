import 'package:flutter/material.dart';
import 'package:teste_app/Common/MyRouters.dart';

class NowPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => NowPageState();
}

class NowPageState extends State<NowPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ElevatedButton(
        child: Text("MyHomePage"),
        onPressed: () => {Navigator.pushNamed(context, ROUTE_HOME)},
      )),
    );
  }
}
