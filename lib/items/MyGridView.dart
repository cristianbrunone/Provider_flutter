import 'package:flutter/material.dart';
import 'package:teste_app/items/MyCardInformacoes.dart';
import 'package:teste_app/items/MyContainerInformacoes.dart';

class MyGridView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Flexible(
              child: Expanded(
                child: MyCardInfomacoes(),
              ),
            ),
            Flexible(
              child: Expanded(
                child: MyContainerInfomacoes(),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
