import 'package:flutter/material.dart';

class Contentdetail extends StatelessWidget{

  String aboutSpeaker;
  List<String> nameTechnologies;
  Contentdetail(this.aboutSpeaker, this.nameTechnologies);

  @override
  Widget build(BuildContext context) {
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

    return Container(
      height: 250.0,
      child: Column(
        children: <Widget>[
          Text(aboutSpeaker,style: TextStyle(color: Colors.blueGrey,fontSize: 18.0),),
        ],
      ),
    );
  }
}