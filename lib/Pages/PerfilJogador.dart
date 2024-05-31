import 'package:flutter/material.dart';
import 'package:teste_app/items/MyAppBar.dart';
import 'package:teste_app/items/MyGridView.dart';

class PerfilJogador extends StatefulWidget {
  @override
  PerfilJogadorState createState() => PerfilJogadorState();
}

class PerfilJogadorState extends State<PerfilJogador> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      appBar: MyAppBar(),
      body: MyGridView(),
    );
  }
}
