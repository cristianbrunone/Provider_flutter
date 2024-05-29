import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // Agrega esta línea
import 'package:badges/badges.dart' as badges;
import 'package:teste_app/models/produto.dart';
import 'package:teste_app/provider/produto_provider.dart';

class FriendListPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => FriendListPageState();
}

class FriendListPageState extends State<FriendListPage> {
  @override
  Widget build(BuildContext context) {
    var myFavorite = context.watch<ProdutoProvider>().myFavorite;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 247, 245, 245),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            // Implementa la lógica aquí
          },
          icon: Icon(Icons.menu), // Icono de menú
        ),
        actions: [
          IconButton(
            onPressed: () {
              // Implementa la lógica aquí
            },
            icon: Icon(Icons.search), // Icono de búsqueda
          ),
        ],
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 247, 245, 245),
        elevation: 0,
        title: const Text(
          "Meu Nome",
          style: TextStyle(
            color: Color.fromARGB(255, 27, 27, 27),
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
      ),
    );
  }
}
