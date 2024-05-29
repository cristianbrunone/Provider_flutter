import 'package:flutter/material.dart';
import 'package:teste_app/Common/MyRouters.dart';
import 'package:teste_app/Counter.dart';
import 'package:teste_app/Pages/Counter2.dart';
import 'package:teste_app/Pages/MyLoginScreen.dart';
import 'package:teste_app/TextCounter.dart';
import 'package:provider/provider.dart';
import 'package:teste_app/provider/produto_provider.dart';
import 'package:teste_app/screens/home_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProdutoProvider()),
        // Add other providers if needed
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      onGenerateRoute: MyRouters.generateRoute,
      initialRoute: ROUTE_LOGIN,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
            backgroundColor: Color.fromARGB(255, 232, 232, 232)),
      ),
      home: HomeScreen(),
      /*MultiProvider(providers: [
        ChangeNotifierProvider(create: (BuildContext context) => Counter()),
        ChangeNotifierProvider(create: (context) => Counter2())
      ], child: const MyHomePage()),*/
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hola"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            TextCounter(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.read<Counter2>().increment2(),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
