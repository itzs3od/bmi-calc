import 'package:flutter/material.dart';
import 'home.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          color: Colors.teal,
        ),
        textTheme: const TextTheme(
          headline2: TextStyle(fontSize: 46, color: Colors.white, fontWeight: FontWeight.bold),
          headline3: TextStyle(fontSize: 26, color: Colors.black, fontWeight: FontWeight.bold),
          headline4: TextStyle(fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold),
        ),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Colors.teal,
          sizeConstraints: BoxConstraints(
            minHeight: 38,
            minWidth: 38,
          ),
        ),
        primarySwatch: Colors.blue,
        canvasColor: Colors.black,
      ),
      debugShowCheckedModeBanner: false,
      home: const Home(),
    );
  }
}
