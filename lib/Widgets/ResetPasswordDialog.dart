import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:teste_app/Common/TransitionApp.dart';
import 'package:teste_app/Widgets/ButtonBase.dart';
import 'package:teste_app/Widgets/TextFieldBase.dart';

class ResetPasswordDialog extends StatelessWidget {
  TextEditingController ctrlEmail = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Reestablecer Contraseña'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          TextFieldBase(
            "E-mail",
            ctrlEmail,
            height: 50,
          ),
        ],
      ),
      actions: <Widget>[
        CupertinoButton(
          child: Text('Cancelar'),
          onPressed: () => close(context),
        ),
        CupertinoButton(
          child: Text('Restablecer'),
          onPressed: () => reset(),
        ),
      ],
    );
  }

  close(BuildContext context) {
    TransitionApp.closePageOrDialog(context);
  }

  reset() {}
}
