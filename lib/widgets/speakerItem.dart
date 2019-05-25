import 'package:flutter/material.dart';
import 'package:io_extended_gdglapaz/screens/speakerDetail/speakerDetail.dart';
import 'package:io_extended_gdglapaz/util/ui_utils.dart';

class SpeakerItem extends StatelessWidget {

  int sessionId;
  String pathImage;
  String firstName;
  String lastName;
  String jobTitle;

  SpeakerItem(this.sessionId, this.pathImage, this.firstName, this.lastName, this.jobTitle);

  @override
  Widget build(BuildContext context) {
    return InkWell(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => SpeakerDetailScreen(sessionId)));
          },
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 12.0),
            child: Row(
              children: <Widget>[
                Container(
                  width: 60.0,
                  height: 60.0,
                  margin: EdgeInsets.only(top: 2.0, left: 2.0, right: 10.0),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black54, width: 2.0),
                      borderRadius: BorderRadius.circular(100.0)
                  ),
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(pathImage),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                        firstName + " " + lastName,
                        style: TextStyle(
                            color: Colors.black54,
                            fontWeight: FontWeight.bold,
                            fontSize: letter_xm
                        )
                    ),
                    Text(
                        jobTitle,
                        style: TextStyle(
                            color: Colors.black54,
                            fontWeight: FontWeight.w300,
                            fontSize: letter_m
                        )
                    ),
                  ],
                )
              ],
            ),
          )
          );
    }
}
