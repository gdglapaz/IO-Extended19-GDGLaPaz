import 'package:flutter/material.dart';
import 'package:io_extended_gdglapaz/util/palette_utils.dart';

class Topdetail extends StatelessWidget{
  String imagepath,title, date, hour;

  Topdetail(this.imagepath, this.title, this.date, this.hour);

  @override
  Widget build(BuildContext context) {

//    final Icon = Container(
//      child: Icon(imagepath),
//    );
    final TxtTitle = Container(
      padding: EdgeInsets.all(8.0),
      child: Text(title,style: TextStyle(fontSize: 25.0,color: Colors.white),),
    );
    final TxtDate = Container(
      padding: EdgeInsets.all(8.0),
      child: Text(date,style: TextStyle(fontSize: 15.0,color: Colors.white),),
    );
    final TxtHour = Container(
      padding: EdgeInsets.all(8.0),
      child: Text(hour,style: TextStyle(fontSize: 15.0,color: Colors.white),),
    );

    return Container(
      padding: EdgeInsets.all(32.0),
      height: 180.0,
      width: 450.0,
      color: Color(primaryColor),
      child: Column(
        children: <Widget>[
          TxtTitle,
          TxtDate,
          TxtHour
        ],
      ),
    );

  }


}








