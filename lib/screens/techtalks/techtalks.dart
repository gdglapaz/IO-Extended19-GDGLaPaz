import 'package:flutter/material.dart';
import 'package:timeline_list/timeline.dart';
import 'package:timeline_list/timeline_model.dart';
import 'package:io_extended_gdglapaz/screens/techtalks/widgets/sessionItem.dart';

class TechtalksScreen extends StatelessWidget {

  List<TimelineModel> items = [
    TimelineModel(SessionItem(1, '09:00','','Sam Smith', 'Lets talk about Flutter', ['Flutter', 'Sketch', 'Adobe XD']),
      position: TimelineItemPosition.random,
      iconBackground: Colors.lightGreenAccent,
    ),
    TimelineModel(SessionItem(1, '09:45','','Podrick Stone', 'Lets talk about Flutter', ['Angular', 'Firebase']),
      position: TimelineItemPosition.left,
      iconBackground: Colors.lightGreenAccent,
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Timeline(children: items, lineColor: Colors.black54, lineWidth: 1.0, position: TimelinePosition.Left),
    );
  }
}
