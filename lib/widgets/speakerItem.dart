import 'package:flutter/material.dart';
import 'package:io_extended_gdglapaz/screens/speakerDetail/speakerDetail.dart';
import 'package:io_extended_gdglapaz/util/ui_utils.dart';

class SpeakerItem extends StatelessWidget {

  int speakerId;
  String pathImage;
  String firstName;
  String lastName;
  String jobTitle;

  SpeakerItem(this.speakerId, this.pathImage, this.firstName, this.lastName, this.jobTitle);

  @override
  Widget build(BuildContext context) {
    return InkWell(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => SpeakerDetailScreen(speakerId)));
          },
          child: Container(
            margin: EdgeInsets.only(top: margin_xm),
            child: Row(
              children: <Widget>[
                Container(
                  width: 60.0,
                  height: 60.0,
                  margin: EdgeInsets.only(top: 2.0, left: 2.0, right: 10.0),
                  child: CircleAvatar(
                    backgroundImage: AssetImage(pathImage),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                          firstName + " " + lastName,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          textDirection: TextDirection.ltr,
                          style: TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.bold,
                              fontSize: letter_xm
                          )
                      ),
                      Text(
                          jobTitle,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          textDirection: TextDirection.ltr,
                          style: TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.w300,
                              fontSize: letter_m
                          )
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
          );
    }
}
