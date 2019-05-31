import 'package:flutter/material.dart';
import 'package:timeline_list/timeline.dart';
import 'package:timeline_list/timeline_model.dart';
import 'package:io_extended_gdglapaz/widgets/sessionItem.dart';
import 'package:io_extended_gdglapaz/providers/db_provider.dart';

class TechtalksScreen extends StatefulWidget {
  @override
  _TechtalksScreenState createState() => _TechtalksScreenState();
}

class _TechtalksScreenState extends State<TechtalksScreen> {
  
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Map>>(
        future: DBProvider.db.getTechTalks(),
        builder: (BuildContext context, AsyncSnapshot<List<Map>> snapshot){
          if(!snapshot.hasData){
            return Center(child: CircularProgressIndicator(),);
          }

          final sessions = snapshot.data;

          List<TimelineModel> itemsSessions = [];

          for (Map<String, dynamic> data in sessions) {
            itemsSessions.add(
              TimelineModel(
                data["id_speaker"] != null ? SessionItem(data['id_session'], data['time'], data['pathImage'], data['firstName'] + ' ' +data['lastName'], data['title'], data['hasDetails'])
                    : SessionItem(data['id_session'], data['time'], data['extraPathImage'], data['extraTitle'], data['title'], data['hasDetails']),
                position: TimelineItemPosition.left,
                iconBackground: Colors.lightGreenAccent,
              )
            );
          }

          return Container(
            child: Timeline(children: itemsSessions, lineColor: Colors.black54, lineWidth: 1.0, position: TimelinePosition.Left),
          );
        }
    );
  }
}

