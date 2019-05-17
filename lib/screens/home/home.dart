import 'package:flutter/material.dart';
import 'package:io_extended_gdglapaz/util/palette_utils.dart';
import 'package:io_extended_gdglapaz/screens/techtalks/techtalks.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(primaryColor),
          leading: Icon(
            Icons.menu,
            color: Colors.white,
          ),
          title: Container(
            child: Text(
              "I/O Extended",
              textDirection: TextDirection.ltr,
            ),
          ),
          actions: <Widget>[
            Container(
              width: 50.0,
              height: 50.0,
              margin: EdgeInsets.all(2.0),
              child: CircleAvatar(
                backgroundImage: NetworkImage("https://www.websa100.com/wp-content/uploads/2016/05/foto-en-blanco-y-negro.png"),
              ),
            )
          ],
        ),
        body: TechtalksScreen(),
      ),
    );
  }
}
