import 'package:flutter/material.dart';

class Speakerdetail extends StatelessWidget{

  double sizeAvatar = 35.0;
  String fullName;
  String detName;

  Speakerdetail(this.fullName, this.detName);

  @override
  Widget build(BuildContext context) {
    final avatarWidget = Container(
      margin: EdgeInsets.only(left: 10.0),
      child: CircleAvatar(
        backgroundImage: NetworkImage("https://www.websa100.com/wp-content/uploads/2016/05/foto-en-blanco-y-negro.png"),
        radius: sizeAvatar,
      ),
    );

    final fullNameWidget = Text(
      fullName,
      textDirection: TextDirection.ltr,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.black54,
        fontSize: 20.0,
      ),
    );


    final titleTalkWidget = Container(
        child: Text(
          detName,
          textDirection: TextDirection.ltr,
          style: TextStyle(
              fontSize: 22.0,
              color: Colors.black54
          ),
        )
    );

    final cardSessionWidget = Container(
        height: 104.0,
        margin: EdgeInsets.only(top: 1.0, bottom: 5.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18.0),
            border: Border.all(color: Colors.black54, width: 1.0, style: BorderStyle.solid)
        ),
        child: Container(

          child: Row(
            children: <Widget>[
              avatarWidget,
              Container(
                padding: EdgeInsets.only(left: 10.0, top: 5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    fullNameWidget,
                    titleTalkWidget,
                  ],
                ),
              )
            ],
          ),
        )
    );

    return cardSessionWidget;
  }

}