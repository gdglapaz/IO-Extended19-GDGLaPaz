import 'package:flutter/material.dart';
import 'package:io_extended_gdglapaz/screens/sessionDetail/sessionDetail.dart';

class SessionItem extends StatelessWidget {

  int id;
  String sessionTime;
  String pathImage;
  String fullName;
  String titleTalk;
  List<String> nameTechnologies;

  double sizeAvatar = 35.0;

  SessionItem(this.id, this.sessionTime, this.pathImage, this.fullName, this.titleTalk, this.nameTechnologies);

  @override
  Widget build(BuildContext context) {
    final avatarWidget = Container(
      margin: EdgeInsets.only(left: 10.0),
      child: CircleAvatar(
        backgroundImage: NetworkImage("${pathImage}"),
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
          titleTalk,
          textDirection: TextDirection.ltr,
          style: TextStyle(
              fontSize: 22.0,
              color: Colors.black54
          ),
        )
    );

    final listChipWidget = ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.all(8.0),
        itemCount: nameTechnologies.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            child: Transform(
                transform: new Matrix4.identity()..scale(0.9),
                child: Chip(
                  label: Text(
                    '${nameTechnologies[index]}',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  backgroundColor: Colors.blue,
                )
            ),
          );
        }
    );

    final timeWidget = Container(
        margin: EdgeInsets.only(left: 5.0, top: 5.0),
        child: Text(
          sessionTime,
          textDirection: TextDirection.ltr,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.deepPurple,
            fontSize: 20.0,
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
        child: InkWell(
          borderRadius: BorderRadius.circular(19.0),
          onTap: (){

            Navigator.push(
            context,
              MaterialPageRoute(builder: (context) => Sessiondetail()),
            );
          },
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
                    Container(
                      width: 230.0,
                      height: 47.0,
                      child: listChipWidget,

                    ),
                  ],
                ),


              )
            ],
          ),
        )
    );

    return Container(

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          timeWidget,
          cardSessionWidget
        ],
      ),
    );
  }
}
