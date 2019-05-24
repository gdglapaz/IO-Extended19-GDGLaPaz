import 'package:flutter/material.dart';
import 'package:io_extended_gdglapaz/screens/sessionDetail/widgets/Topdetail.dart';
import 'package:io_extended_gdglapaz/screens/sessionDetail/widgets/Speakerdetail.dart';
import 'package:io_extended_gdglapaz/screens/sessionDetail/widgets/Contentdetail.dart';
import 'package:io_extended_gdglapaz/screens/speakerDetail/speakerDetail.dart';
import 'package:io_extended_gdglapaz/util/ui_utils.dart';
import 'package:io_extended_gdglapaz/widgets/chipList.dart';

class Sessiondetail extends StatelessWidget{

  final exampleText = "Lorem ipsum dolor sit amet consectetur adipiscing, elit felis eget suspendisse pharetra purus, lobortis porta senectus erat auctor. Ridiculus nostra tincidunt proin eget taciti vitae id dignissim nascetur tristique, eros viverra mauris odio quis luctus sodales hac hendrerit sem litora, aliquet facilisis felis in vivamus justo netus ultrices urna.";

  @override
  Widget build(BuildContext context) {
    

    final sessionDetailAppbar = Stack(
      children: <Widget>[
        Container(
          height: 200.0,
          width: double.infinity,
          color: Theme.of(context).primaryColor,
        ),
        Positioned(
          top: 80.0,
          left: 100.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(bottom: 5.0),
                child: Text(
                  "Title Tech Talk",
                   style: TextStyle(
                     color: Colors.white,
                     fontSize: letter_x,
                     fontWeight: FontWeight.bold
                   ),
                )
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 5.0),
                child: Text(
                  "Sábado, 1ro de Junio",
                   style: TextStyle(
                     color: Colors.white,
                     fontSize: letter_m,
                     fontWeight: FontWeight.w300
                   ),
                )
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 5.0),
                child: Text(
                  "09:00 AM",
                   style: TextStyle(
                     color: Colors.white,
                     fontSize: letter_md,
                     fontWeight: FontWeight.w600
                   ),
                )
              ),
            ],
          ),
        ),
        Positioned(
          top: 40.0,
          left: 20.0,
          child: InkWell(
                onTap: (){
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.white,            
                ),
          )
        )
      ],
    );
    
    final speakerContainer = InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => SpeakerDetailScreen()));
      },
      child: Container(
        height: 120.0,
        width: 800.0,
        child: Padding(
          padding: EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Speaker",
               style:
                TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: letter_md,
                  fontWeight: FontWeight.bold 
                )    
            ),
            Container(
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
                      backgroundImage: NetworkImage("https://www.websa100.com/wp-content/uploads/2016/05/foto-en-blanco-y-negro.png"),
                         ),
                 ),
                 Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: <Widget>[
                     Text(
                       "Full Name",
                       style: TextStyle(
                         color: Colors.black54,
                         fontWeight: FontWeight.bold,
                         fontSize: letter_xm
                       )
                     ),
                     Text(
                       "Google Developer Expert in Angular",
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
          ],
        ),
        )
      )
    );

    final sessionDescription = Container(
      padding: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
           Text(
          "Descripción",
           style:
           TextStyle(
             color: Theme.of(context).primaryColor,
             fontSize: letter_md,
             fontWeight: FontWeight.bold 
           )    
          ),
          Container(width: 300.0, height: 35.0, child: ChipList(5)),
          Container(
              padding: EdgeInsets.all(5.0),
              child: Text(
                exampleText,
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: letter_m,
                  fontWeight: FontWeight.w300
                ),
              ),
            ),
        ],
      ),
    );

    final commentsButton = Container(
      height: 65.0,
      width: 65.0,
      decoration: BoxDecoration(
        color: Colors.blue,
        shape: BoxShape.circle
      ),
      child: Icon(
        Icons.add_comment,
        color: Colors.white,
      ),
    );

    final myScreen = Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          sessionDetailAppbar,
          speakerContainer,
          sessionDescription,
        ],
      );

    final screenStack = Stack(
      children: <Widget>[
        Container(
          color: Colors.transparent,
        ),
        myScreen,
        Positioned(
          top: 170.0,
          right: 20.0,
          child: commentsButton,
        )
      ],
    );

    

    return Scaffold(
      body: screenStack
    );
  }
}