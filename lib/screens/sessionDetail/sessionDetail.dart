import 'package:flutter/material.dart';
import 'package:io_extended_gdglapaz/screens/sessionDetail/widgets/Topdetail.dart';
import 'package:io_extended_gdglapaz/screens/sessionDetail/widgets/Speakerdetail.dart';
import 'package:io_extended_gdglapaz/screens/sessionDetail/widgets/Contentdetail.dart';
import 'package:io_extended_gdglapaz/screens/speakerDetail/speakerDetail.dart';

class Sessiondetail extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
        ),
        body: Container(
          color: Colors.white,
          child: Column(
            children: <Widget>[
              Topdetail('JJJ', 'Learning Flutter', 'Saturday Morning', '14:00'),
              Text('Speaker',style: Theme.of(context).textTheme.subtitle),
              InkWell(
                onTap: (){
                Navigator.push(
                context,
                  MaterialPageRoute(builder: (context) => SpeakerDetailScreen("https://www.websa100.com/wp-content/uploads/2016/05/foto-en-blanco-y-negro.png", "Full Name", """Lorem ipsum dolor sit amet consectetur adipiscing, elit felis eget suspendisse pharetra purus, lobortis porta senectus erat auctor. Ridiculus nostra tincidunt proin eget taciti vitae id dignissim nascetur tristique, eros viverra mauris odio quis luctus sodales hac hendrerit sem litora, aliquet facilisis felis in vivamus justo netus ultrices urna.""")),
                );
                },
                child: Speakerdetail('Johnn Hidalgo', 'GDG La Paz')
              ),
              Text('Description',style: Theme.of(context).textTheme.subtitle),
              Contentdetail('Because you already merged in iss53 earlier, you see it in your list. Branches on this list without the * in front of them are generally fine to delete with git branch -d; you’ve already incorporated their work into another branch, so you’re not going to lose anything.', ['Flutter', 'Sketch', 'Adobe XD'])
            ],
          ),
        )
    );
  }
}