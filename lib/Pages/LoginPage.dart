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
  GlobalKey<FormState> formKey = GlobalKey();
  bool _obscureText = true;
  double containerHeight = 52.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            autovalidateMode: AutovalidateMode
                .onUserInteraction, // Configura autovalidateMode en el Form
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
                SizedBox(height: 20),
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
                      emailIcon: Icons.person,
                      height: containerHeight,
                      validator: validateEmail,
                      autovalidateMode: AutovalidateMode
                          .onUserInteraction, // Pasa autovalidateMode a TextFieldBase
                    ),
                    SizedBox(
                        height:
                            20), // Añade este SizedBox después de cada TextFieldBase
                    TextFieldBase(
                      "Senha",
                      ctrlPass,
                      height: containerHeight,
                      obscureText: _obscureText,
                      validator: validatePass,
                      icon: Icons.visibility_off,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      onToggleVisibility: togglePasswordVisibility,
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
                      name: "Entrar",
                      height: 52,
                      onTap: () => login(),
                    ),
                    ButtonBase(
                      name: "Fazer meu cadastro",
                      color: Color.fromARGB(255, 0, 238, 206),
                      textColor: Color.fromARGB(255, 0, 43, 151),
                      height: 52,
                      onTap: () => signUp(),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void login() {
    // Valida el formulario
    if (formKey.currentState!.validate()) {
      // Aquí puedes realizar el inicio de sesión
      print("Login com sucesso");
      formKey.currentState?.reset();
    } else {
      // Si hay errores de validación, actualiza la altura del contenedor
      setState(() {
        // Verifica si hay errores de validación en los campos de texto
        final emailError = validateEmail(ctrlEmail.text);
        final passError = validatePass(ctrlPass.text);

        containerHeight = 52;
        // Actualiza la altura del contenedor si hay errores
        containerHeight = (emailError != null || passError != null)
            ? (52.0 + 0) // Incrementa la altura en 5.0 si hay errores
            : 52.0; // Restablece la altura original si no hay errores
      });
    }
  }

  void signUp() {}

  void togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  Future<void> resetPassword(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return ResetPasswordDialog();
      },
    );
  }

  String? validateEmail(String? email) {
    final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    if (email == null || email.isEmpty) {
      return "O E-mail é necessario";
    } else if (!emailRegExp.hasMatch(email)) {
      return "O E-mail é inválido";
    }

    return null;
  }

  String? validatePass(String? value) {
    if (value == null || value.isEmpty) {
      return "A senha é necessaria";
    } else if (value.length < 6) {
      return "A senha deve ter pelo menos 6 caracteres";
    }
    return null;
  }
}
