import 'package:flutter/material.dart';
import 'package:io_extended_gdglapaz/screens/sessionDetail/sessionDetail.dart';
import 'package:io_extended_gdglapaz/util/ui_utils.dart';
import 'chipList.dart';

class SessionItem extends StatelessWidget {
  int id;
  String sessionTime;
  String pathImage;
  String fullName;
  String titleTalk;
  List<String> nameTechnologies;

  double sizeAvatar = 28.0;

  SessionItem(this.id, this.sessionTime, this.pathImage, this.fullName, this.titleTalk, this.nameTechnologies);

  @override
  Widget build(BuildContext context) {
    final avatarWidget = Container(
      margin: EdgeInsets.only(left: margin_s),
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
        fontSize: letter_m,
      ),
    );

    final titleTalkWidget = Container(
        child: Text(
          titleTalk,
          textDirection: TextDirection.ltr,
          style: TextStyle(
              fontSize: letter_md,
              color: Colors.black54
          ),
        )
    );

    final timeWidget = Container(
        margin: EdgeInsets.only(left: margin_xs, top: margin_xs),
        child: Text(
          sessionTime,
          textDirection: TextDirection.ltr,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.deepPurple,
            fontSize: letter_m,
          ),
        )
    );

    final cardSessionWidget = Container(
        height: 86.0,
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
              Expanded(
                flex: 2,
                child: avatarWidget,
              ),
              Expanded(
                flex: 8,
                child: Container(
                  padding: EdgeInsets.only(left: margin_s, top: 5.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      fullNameWidget,
                      titleTalkWidget,
                      Container(
                        width: 230.0,
                        height: 35.0,
                        child: ChipList(id),
                      ),
                    ],
                  ),
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
