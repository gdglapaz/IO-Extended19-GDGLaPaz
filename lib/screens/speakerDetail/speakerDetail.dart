import 'package:flutter/material.dart';
import 'package:io_extended_gdglapaz/util/ui_utils.dart';

class SpeakerDetailScreen extends StatelessWidget {
  @override

  String speakerPhoto = "https://www.websa100.com/wp-content/uploads/2016/05/foto-en-blanco-y-negro.png";
  String speakerName = "Full Name";
  String speakerDescription = "Google Expert in Angular";

  String speakerLocation = "La Paz, Bolivia";

  String speakerAbout = """Lorem ipsum dolor sit amet consectetur adipiscing, elit felis eget suspendisse pharetra purus, lobortis porta senectus erat auctor. Ridiculus nostra tincidunt proin eget taciti vitae id dignissim nascetur tristique, eros viverra mauris odio quis luctus sodales hac hendrerit sem litora, aliquet facilisis felis in vivamus justo netus ultrices urna.""";

  final linkedinLogo = "https://upload.wikimedia.org/wikipedia/commons/c/ca/LinkedIn_logo_initials.png";
  final linkedinApp = "Linkedin";

  final twitterLogo = "http://pngimg.com/uploads/twitter/twitter_PNG32.png";
  final twitterApp = "Twitter";

  SpeakerDetailScreen(this.speakerPhoto, this.speakerName, this.speakerDescription);

  Widget build(BuildContext context) {

    final speakerPhoto_Container = Container(
              width: 100.0,
              height: 100.0,
              margin: EdgeInsets.all(2.0),
              child: CircleAvatar(
                backgroundImage: NetworkImage(speakerPhoto),
              ),
            );

    final speakerName_Text =  Text("Full Name",
              style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
              fontWeight: FontWeight.bold
              ),
            );

    final speakerDescription_Text = 
            Text("Google Developer Expert in Angular",
              style: TextStyle(
              color: Colors.white,
              fontSize: 16.0,
              ),
            );

    final speakersAppBar = Container(
      color: Theme.of(context).primaryColor,
      height: 250.0,
      width: double.infinity,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(bottom: 5.0),
              child: speakerPhoto_Container,
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 5.0),
              child: speakerName_Text,
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 5.0),
              child: speakerDescription_Text,
            )
          ],
        ),
      ),
    );

    final location_Text = Row(
      children: <Widget>[
        Icon(
          Icons.location_on,
          color: Colors.black54,
        ),
        Padding(
          padding: EdgeInsets.only(left: 10.0),
          child: Text(speakerLocation, 
          style: TextStyle(
            color: Colors.black54,
            fontSize: 16.0
          ),
          )
        )
      ],
    );

    final linkedin_Inkwell = InkWell(
      onTap: (){
        //Open Linkedin App
      },
      child: Row(
      children: <Widget>[
        Container(
              margin: EdgeInsets.only(left: 4.0),
              width: 20.0,
              height: 20.0,
              decoration: BoxDecoration(
               image: DecorationImage(
                 image: NetworkImage(linkedinLogo) 
               )
              ),
            ),
        Padding(
          padding: EdgeInsets.only(left: 10.0),
          child: Text(linkedinApp, 
          style: TextStyle(
            color: Colors.black54,
            fontSize: 16.0
          ),
          )
        )
      ],
    )
    );

    final twitter_Inkwell = InkWell(
      onTap: (){
        //Open Twitter App
      },
      child: Row(
      children: <Widget>[
        Container(
              margin: EdgeInsets.only(left: 4.0),
              width: 20.0,
              height: 20.0,
              decoration: BoxDecoration(
               image: DecorationImage(
                 image: NetworkImage(twitterLogo) 
               )
              ),
            ),
        Padding(
          padding: EdgeInsets.only(left: 10.0),
          child: Text(twitterApp, 
          style: TextStyle(
            color: Colors.black54,
            fontSize: 16.0
          ),
          )
        )
      ],
    )
    );

    final informationContainer = Container(
      height: 150.0,
      width: 360.0,
      decoration: BoxDecoration(
        color: Colors.white,
        border: new Border .all(
          color: Theme.of(context).dividerColor,
          width: 1.5
        ),
        borderRadius: BorderRadius.all(Radius.circular(8.0))
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
        child: Column(
        children: <Widget>[
          Align(
            alignment: Alignment.centerLeft,
            child: Text("Información",
            style: TextStyle(
             color: Theme.of(context).primaryColor,
             fontSize: 20.0,
             fontWeight: FontWeight.bold
           ),),
          ),
          Padding(
            padding: EdgeInsets.only(top: 8.0),
            child: location_Text,
          ),
          Padding(
            padding: EdgeInsets.only(top: 8.0),
            child: linkedin_Inkwell,
          ),
          Padding(
            padding: EdgeInsets.only(top: 8.0),
            child: twitter_Inkwell,
          )
        ],
      ),
      )
    );

    final about_Text = Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Icon(
          Icons.info_outline,
          color: Colors.black54,
          ),
        Flexible(
          child: Padding(
            padding: EdgeInsets.only(left: 20.0),
            child: Text(
            speakerAbout,
            style: TextStyle(
              color: Colors.black54,
              fontSize: 16.0,
              fontWeight: FontWeight.normal
              ),
            ),
          )
        )  
      ],
    );

    final aboutContainer = Container(
      height: 280.0,
      width: 360.0,
      decoration: BoxDecoration(
        color: Colors.white,
        border: new Border .all(
          color: Theme.of(context).dividerColor,
          width: 1.5
        ),
        borderRadius: BorderRadius.all(Radius.circular(8.0))
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
        child: Column(
        children: <Widget>[
          Align(
            alignment: Alignment.centerLeft,
            child: Text("About",
            style: TextStyle(
             color: Theme.of(context).primaryColor,
             fontSize: 20.0,
             fontWeight: FontWeight.bold
           ),),
          ),
          Padding(
            padding: EdgeInsets.only(top: 8.0),
            child: about_Text,
          ) 
        ],
      ),
      )
    );

    final arrowAppbar = InkWell(
      child: Icon(
        Icons.arrow_back,
        color: Colors.white, 
      )
    );

    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: <Widget>[
            Container(
              color: Colors.transparent,
              width: double.infinity,
              height: double.infinity,
            ),
            speakersAppBar,
            Positioned(
              top: 35.0,
              left: 20.0,
              child: arrowAppbar,
            ),
            Positioned(
              bottom: 310.0,
              left: 25.0,
              child: informationContainer,
            ),
            Positioned(
              bottom: 20.0,
              left: 25.0,
              child: aboutContainer,
            )
          ],
        ),
      ),
    );
  }
}