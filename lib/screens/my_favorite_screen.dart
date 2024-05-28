import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // Add this line
import 'package:badges/badges.dart' as badges;
import 'package:teste_app/models/produto.dart';
import 'package:teste_app/provider/produto_provider.dart';

class MyFavoriteScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MyFavoriteScreenState();
}

class MyFavoriteScreenState extends State<MyFavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    var myFavorite = context.watch<ProdutoProvider>().myFavorite;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Meus Favoritos",
          style: TextStyle(color: Colors.blueGrey),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, mainAxisSpacing: 5.0, crossAxisSpacing: 5.0),
            itemCount: myFavorite.length,
            itemBuilder: (context, index) {
              Produto produto = myFavorite[index];
              return Card(
                key: ObjectKey(produto),
                color: Colors.white,
                elevation: 1,
                child: Column(
                  children: [
                    Image.asset(
                      produto.image,
                      width: 100,
                      height: 100,
                    ),
                    Text(produto.title),
                    Text(produto.price.toString())
                  ],
                ),
              );
            }),
      ),
    );
  }
}
