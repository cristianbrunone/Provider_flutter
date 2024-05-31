import 'package:flutter/cupertino.dart';

class TransitionApp {
  static closePageOrDialog(BuildContext context) {
    Navigator.of(context, rootNavigator: true).pop();
  }
}
