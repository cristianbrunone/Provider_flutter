import 'package:flutter/material.dart';
import 'package:teste_app/Counter.dart';
import 'package:provider/provider.dart';
import 'package:teste_app/Pages/Counter2.dart';

class TextCounter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      context.watch<Counter2>().count2.toString(),
      style: Theme.of(context).textTheme.headlineMedium,
    );
  }
}
