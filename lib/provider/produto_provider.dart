import 'dart:math';

import 'package:flutter/material.dart';
import 'package:teste_app/models/produto.dart';

List<Produto> initialData = List.generate(
    20,
    (index) => Produto(
        title: "Tenis $index",
        price: double.parse((Random().nextInt(100) * index).toString()),
        image: 'assets/imgs/futebol.png'));

class ProdutoProvider extends ChangeNotifier {
  List<Produto> _produtos = initialData;

  List<Produto> get produtos => _produtos;

  List<Produto> _myFavorite = [];

  List<Produto> get myFavorite => _myFavorite;

  void addToMyFavorite(Produto produto) {
    _myFavorite.add(produto);
    notifyListeners();
  }

  void removeMyFavorite(Produto produto) {
    _myFavorite.remove(produto);
    notifyListeners();
  }
}
