import 'package:flutter/material.dart';
import 'package:io_extended_gdglapaz/screens/home/home.dart';
import 'package:io_extended_gdglapaz/util/ui_utils.dart';

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
        primaryColor: Color(0xFF8500CC),
        primaryColorDark: Color(0xFF530080),
        accentColor: Color(0xFF0091EA),
        dividerColor: Color(0xFFBDBDBD),
        textTheme: Theme.of(context).textTheme.copyWith(
          title: new TextStyle(color: Color(0xFF363636)),
          subtitle: new TextStyle(color: Color(0xFF757575)),
          subhead: new TextStyle(color: Color(0xFF530080))
        ),
      ),
    );
  }
}