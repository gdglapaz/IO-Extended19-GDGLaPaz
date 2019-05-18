import 'package:flutter/material.dart';
import 'package:io_extended_gdglapaz/screens/sessionDetail/widgets/Topdetail.dart';
import 'package:io_extended_gdglapaz/screens/sessionDetail/widgets/Speakerdetail.dart';
import 'package:io_extended_gdglapaz/screens/sessionDetail/widgets/Contentdetail.dart';
import 'package:io_extended_gdglapaz/util/palette_utils.dart';

class Sessiondetail extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Topdetail('JJJ', 'Learning Flutter', 'Saturday Morning', '14:00'),
          Text('Speaker',style: TextStyle(fontSize: 25.0,color: Color(dividerColor) ),),
          Speakerdetail('Johnn Hidalgo', 'GDG La Paz'),
          Text('Description',style: TextStyle(fontSize: 25.0,color: Color(dividerColor) ),),
          Contentdetail('Because you already merged in iss53 earlier, you see it in your list. Branches on this list without the * in front of them are generally fine to delete with git branch -d; you’ve already incorporated their work into another branch, so you’re not going to lose anything.', ['Flutter', 'Sketch', 'Adobe XD'])
        ],
      ),
    );
  }
}