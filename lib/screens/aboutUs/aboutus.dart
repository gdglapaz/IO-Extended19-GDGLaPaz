import 'package:flutter/material.dart';
import 'package:io_extended_gdglapaz/widgets/menu.dart';
import 'package:io_extended_gdglapaz/util/ui_utils.dart';

class AboutUsScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          drawer: Menu(),
          appBar: AppBar(
            title: Text('About Us'),
          ),
          body: Container(
              color: Colors.white,//container
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    width: 200.0,
                    child:  Image.asset ('assets/img/gdglapaz_square.png'),
                  ),
                  Container(
                    margin: EdgeInsets.all(margin_m),
                    child: Text(
                      'Somos un grupos de personas apasionadas por la tecnología, parte de una red enorme de comunidades de desarrolladores y con gente comprometida con impulsar el ecosistema tecnológico y emprendedor de la ciudad y del país. \n\n'
                      'Empoderamos personas con tecnologia, organizando eventos tecnológicos, studyjams, meetups, etc.',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: letter_m
                      ),
                    ),
                  ),
                 ],
              )
          )
      );
  }
}
