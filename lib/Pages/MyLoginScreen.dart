import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:teste_app/Common/MyRouters.dart';
import 'package:teste_app/main.dart';

class MyLoginScreen extends StatefulWidget {
  const MyLoginScreen({Key? key}) : super(key: key);

  @override
  State<MyLoginScreen> createState() => _MyLoginState();
}

enum FormType { login, register }

class _MyLoginState extends State<MyLoginScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late GlobalKey<FormState> _loginFormKey;
  late GlobalKey<FormState> _registerFormKey;
  final _emailController = TextEditingController();
  final _senhaController = TextEditingController();
  FormType formType = FormType.login;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _loginFormKey = GlobalKey<FormState>();
    _registerFormKey = GlobalKey<FormState>();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Align(
                alignment: Alignment(0.0, -1.4),
                child: Container(
                  height: MediaQuery.of(context).size.width / 1.1,
                  width: MediaQuery.of(context).size.width / 1.1,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color.fromARGB(255, 0, 155, 132).withOpacity(0.5),
                  ),
                ),
              ),
              Align(
                alignment: Alignment(-2.7, -1.2),
                child: Container(
                  height: MediaQuery.of(context).size.width / 1.5,
                  width: MediaQuery.of(context).size.width / 1.5,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color.fromARGB(255, 0, 142, 213).withOpacity(0.5),
                  ),
                ),
              ),
              Align(
                alignment: Alignment(2.7, -1.2),
                child: Container(
                  height: MediaQuery.of(context).size.width / 1.5,
                  width: MediaQuery.of(context).size.width / 1.5,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color.fromARGB(206, 0, 180, 105),
                  ),
                ),
              ),
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 100.0, sigmaY: 100.0),
                child: Container(),
              ),
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  height: MediaQuery.of(context).size.height / 1.6,
                  child: Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: Image.asset(
                          'assets/imgs/futebol.png',
                          height: 180,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 50.0),
                        child: TabBar(
                          controller: _tabController,
                          unselectedLabelColor: Color.fromARGB(255, 0, 110, 88),
                          labelColor: Color.fromARGB(255, 0, 0, 0),
                          tabs: [
                            Padding(
                              padding: EdgeInsets.all(12.0),
                              child: Text(
                                'Entrar',
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(12.0),
                              child: Text(
                                'Criar',
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                          height: 14), // Space between TabBar and TextFields
                      Expanded(
                        child: TabBarView(
                          controller: _tabController,
                          children: [
                            // Login Form...
                            Container(
                              child: Form(
                                key: _loginFormKey,
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    // Email Field...
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 20),
                                      child: TextFormField(
                                        controller: _emailController,
                                        decoration: InputDecoration(
                                          hintText: 'name@email.com',
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          filled: true,
                                          fillColor: Colors.white,
                                        ),
                                        validator: (email) {
                                          if (email == null || email.isEmpty) {
                                            return 'Digite seu e-mail';
                                          } else if (!_isValidEmail(email)) {
                                            return 'Digite um e-mail válido';
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                    SizedBox(height: 12),
                                    // Password Field...
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 20),
                                      child: TextFormField(
                                        controller: _senhaController,
                                        obscureText: true,
                                        decoration: InputDecoration(
                                          hintText: 'Digite sua senha',
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          filled: true,
                                          fillColor: Colors.white,
                                        ),
                                        validator: (senha) {
                                          if (senha == null || senha.isEmpty) {
                                            return 'Digite sua Senha';
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                    SizedBox(height: 24),
                                    // Login Button...
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 20),
                                      child: ElevatedButton(
                                        onPressed: () => {
                                          Navigator.pushNamed(
                                            context,
                                            ROUTE_HOME,
                                          )
                                        },
                                        style: ElevatedButton.styleFrom(
                                          foregroundColor: Colors.white,
                                          backgroundColor:
                                              Color.fromARGB(255, 2, 73, 206),
                                          padding: EdgeInsets.symmetric(
                                              vertical: 16),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          textStyle: TextStyle(
                                            fontSize: 18,
                                          ),
                                        ),
                                        child: Text('Login'),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            // Register Form...
                            Container(
                              child: Form(
                                key: _registerFormKey,
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    // Email Field...
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 20),
                                      child: TextFormField(
                                        controller: _emailController,
                                        decoration: InputDecoration(
                                          hintText: 'name@email.com',
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          filled: true,
                                          fillColor: Colors.white,
                                        ),
                                        validator: (email) {
                                          if (email == null || email.isEmpty) {
                                            return 'Digite seu e-mail';
                                          } else if (!_isValidEmail(email)) {
                                            return 'Digite um e-mail válido';
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                    SizedBox(height: 12),
                                    // Password Field...
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 20),
                                      child: TextFormField(
                                        controller: _senhaController,
                                        obscureText: true,
                                        decoration: InputDecoration(
                                          hintText: 'Digite sua senha',
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          filled: true,
                                          fillColor: Colors.white,
                                        ),
                                        validator: (senha) {
                                          if (senha == null || senha.isEmpty) {
                                            return 'Digite sua Senha';
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                    SizedBox(height: 24),
                                    // Register Button...
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 20),
                                      child: ElevatedButton(
                                        onPressed: () {},
                                        style: ElevatedButton.styleFrom(
                                          foregroundColor: Colors.white,
                                          backgroundColor:
                                              Color.fromARGB(255, 0, 157, 76),
                                          padding: EdgeInsets.symmetric(
                                              vertical: 16),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          textStyle: TextStyle(
                                            fontSize: 18,
                                          ),
                                        ),
                                        child: Text('Cadastrar'),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  bool _isValidEmail(String email) {
    final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegExp.hasMatch(email);
  }
}
