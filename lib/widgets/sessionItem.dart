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
  int hasDetails;

  double sizeAvatar = 28.0;

  SessionItem(this.id, this.sessionTime, this.pathImage, this.fullName, this.titleTalk, this.hasDetails);

  @override
  Widget build(BuildContext context) {
    final avatarWidget = Container(
      margin: EdgeInsets.only(left: margin_s),
      child: CircleAvatar(
        backgroundImage: AssetImage(pathImage),
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
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
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

    final snackBar = SnackBar(content: Text('Este item no tiene información disponible!!!'));

    final cardSessionWidget = Container(
        height: 82.0,
        margin: EdgeInsets.only(top: 1.0, bottom: 5.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18.0),
            border: Border.all(color: Colors.black54, width: 1.0, style: BorderStyle.solid)
        ),
        child: InkWell(
          onTap: (){
            if(this.hasDetails == 1){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Sessiondetail(id)),
              );
            }
            else{
              Scaffold.of(context).showSnackBar(snackBar);
            }
          },
          child: Row(
            children: <Widget>[
              avatarWidget,
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(left: margin_s, top: 5.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      fullNameWidget,
                      titleTalkWidget,
                      Expanded(
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
