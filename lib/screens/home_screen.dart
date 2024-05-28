import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // Add this line
import 'package:badges/badges.dart' as badges;
import 'package:teste_app/models/produto.dart';
import 'package:teste_app/provider/produto_provider.dart';
import 'package:teste_app/screens/my_favorite_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var myFavorite = context.watch<ProdutoProvider>().myFavorite;
    var produtos = context.watch<ProdutoProvider>().produtos;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Produtos",
          style: TextStyle(color: Colors.blueGrey),
        ),
        actions: [
          badges.Badge(
            position: badges.BadgePosition.topEnd(top: 5, end: 5),
            showBadge: true,
            badgeContent: Text(
              myFavorite.length.toString(),
              style: TextStyle(color: Colors.white, fontSize: 10),
            ),
            badgeStyle: badges.BadgeStyle(
              shape: badges.BadgeShape.square,
              padding: EdgeInsets.all(5),
              borderRadius: BorderRadius.circular(50),
              badgeColor: Colors.redAccent,
              borderSide: BorderSide(color: Colors.white, width: 2),
            ),
            child: IconButton(
              icon: Icon(Icons.person),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => MyFavoriteScreen()));
              },
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: ListView.builder(
            itemCount: produtos.length,
            itemBuilder: (context, index) {
              Produto produto = produtos[index];
              return Card(
                  key: ObjectKey(produto),
                  color: Colors.white,
                  elevation: 1,
                  child: ListTile(
                    contentPadding: EdgeInsets.all(4),
                    leading: Image.asset(
                      produto.image,
                      width: 100,
                      height: 100,
                    ),
                    title: Text(produto.title),
                    subtitle: Text("\$ ${produto.price.toString()}"),
                    trailing: IconButton(
                      icon: Icon(
                        Icons.add_box,
                        color: myFavorite.contains(produto)
                            ? Colors.redAccent
                            : Colors.grey,
                      ),
                      onPressed: () {
                        if (!myFavorite.contains(produto)) {
                          context
                              .read<ProdutoProvider>()
                              .addToMyFavorite(produto);
                        } else {
                          context
                              .read<ProdutoProvider>()
                              .removeMyFavorite(produto);
                        }
                      },
                    ),
                  ));
            }),
      ),
    );
  }
}
