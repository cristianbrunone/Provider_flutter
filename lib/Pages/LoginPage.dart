import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:teste_app/Widgets/ButtonBase.dart';
import 'package:teste_app/Widgets/ResetPasswordDialog.dart';
import 'package:teste_app/Widgets/TextFieldBase.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

enum FormType { login, registrer }

class _LoginPageState extends State<LoginPage> {
  TextEditingController ctrlEmail = TextEditingController();
  TextEditingController ctrlPass = TextEditingController();
  FormType formType = FormType.login;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                child: Image.asset(
                  'assets/imgs/futebol.png',
                  height: 180,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Faça o login",
                style: TextStyle(
                  fontSize: 20,
                  color: Color.fromARGB(255, 2, 54, 241),
                  fontWeight: FontWeight.bold,
                ),
              ),
              Column(
                children: [
                  TextFieldBase(
                    "E-mail",
                    ctrlEmail,
                    icon: Icons.person,
                    height: 52,
                  ),
                  TextFieldBase(
                    "Senha",
                    ctrlPass,
                    icon: Icons.remove_red_eye,
                    height: 52,
                    obscureText: true,
                  ),
                ],
              ),
              InkWell(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: EdgeInsets.only(right: 32, top: 0),
                    child: Text(
                      "Esqueceu a senha?",
                      style: TextStyle(
                        color: Color.fromARGB(255, 0, 53, 186),
                      ),
                    ),
                  ),
                ),
                onTap: () => resetPassword(context),
              ),
              ButtonBase(
                "Entrar",
                login,
                height: 52,
                onPressed: () {
                  login();
                },
              ),
              ButtonBase(
                "Fazer meu cadastro",
                signUp,
                color: Color.fromARGB(255, 0, 238, 206),
                textColor: Color.fromARGB(255, 0, 43, 151),
                height: 52,
                onPressed: signUp,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void login() {}

  void signUp() {}

  Future<void> resetPassword(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return ResetPasswordDialog();
      },
    );
  }
}
