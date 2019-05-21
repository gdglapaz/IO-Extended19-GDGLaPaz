import 'package:flutter/material.dart';
import 'package:timeline_list/timeline.dart';
import 'package:timeline_list/timeline_model.dart';
import 'package:io_extended_gdglapaz/widgets/sessionItem.dart';
import 'package:io_extended_gdglapaz/providers/db_provider.dart';

class CodelabsScreen extends StatefulWidget {
  @override
  _CodelabsScreenState createState() => _CodelabsScreenState();
}

class _CodelabsScreenState extends State<CodelabsScreen> {

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Map>>(
        future: DBProvider.db.getCodelabs(),
        builder: (BuildContext context, AsyncSnapshot<List<Map>> snapshot){
          if(!snapshot.hasData){
            return Center(child: CircularProgressIndicator(),);
          }

          final sessions = snapshot.data;

          List<TimelineModel> itemsSessions = [];

          for (Map<String, dynamic> data in sessions) {
            itemsSessions.add(
                TimelineModel(
                  SessionItem(data['id'], data['time'], data['pathImage'], data['firstName'] + ' ' +data['lastName'], data['title'], ['Flutter', 'Design', 'iOS']),
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

