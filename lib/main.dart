import 'package:flutter/material.dart';
import 'package:io_extended_gdglapaz/screens/home/home.dart';
import 'package:io_extended_gdglapaz/util/palette_utils.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'I/O Extended',
      initialRoute: 'home',
      routes: {
        'home': (BuildContext context) => HomeScreen()
      },
      theme: ThemeData(
        primaryColor: Color(primaryColor),
      ),
    );
  }
}