import 'package:flutter/material.dart';
import 'package:io_extended_gdglapaz/util/ui_utils.dart';
import 'package:io_extended_gdglapaz/models/speakerModel.dart';
import 'package:io_extended_gdglapaz/providers/db_provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/services.dart';

class SpeakerDetailScreen extends StatelessWidget {
  @override

   int speakerId;

  String linkedinLogo = "https://upload.wikimedia.org/wikipedia/commons/c/ca/LinkedIn_logo_initials.png";
  String twitterLogo = "http://pngimg.com/uploads/twitter/twitter_PNG32.png";

  SpeakerDetailScreen(this.speakerId);

  _launchURL(String mUrl) async {
    if (await canLaunch(mUrl)) {
      await launch(mUrl);
    } else {
      throw 'Could not launch $mUrl';
    }
  }

  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: Theme.of(context).primaryColorDark, //or set color with: Color(0xFF0000FF)
    ));

    Widget speakerPhoto_Container (SpeakerModel speakerModel){
      return Container(
              width: 130.0,
              height: 130.0,
              margin: EdgeInsets.all(2.0),
              child: CircleAvatar(
                backgroundImage: AssetImage(speakerModel.pathImage),
              ),
            );
    }

    Widget speakerName_Text (SpeakerModel speakerModel){
      return Text(speakerModel.firstName + " " + speakerModel.lastName,
              style: TextStyle(
              color: Colors.white,
              fontSize: letter_x,
              fontWeight: FontWeight.bold
              ),
            );
    }

    Widget speakerDescription_Text (SpeakerModel speakerModel){
      return Text(
          speakerModel.jobTitle,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: Colors.white,
              fontSize: letter_xm,
          ),
      );
    } 

    Widget speakersAppBar (SpeakerModel speakerModel) {
        return Container(
        color: Theme.of(context).primaryColor,
        height: 250.0,
        width: double.infinity,
        padding: EdgeInsets.only(top: 55.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(bottom: margin_xs),
                child: speakerPhoto_Container(speakerModel),
              ),
              Center(
                child: Padding(
                  padding: EdgeInsets.only(bottom: margin_xs),
                  child: speakerName_Text(speakerModel),
                ),
              ),
              Expanded(
                  child: speakerDescription_Text(speakerModel),
              )
            ],
          ),
      );
    } 

    Widget location_Text (SpeakerModel speakerModel){
        return Row(
        children: <Widget>[
          Icon(
            Icons.location_on,
            color: Colors.black54,
          ),
          Padding(
            padding: EdgeInsets.only(left: 10.0),
            child: Text(speakerModel.countyName, 
            style: TextStyle(
              color: Colors.black54,
              fontSize: 16.0
            ),
            )
          )
        ],
      );
    } 

    Widget linkedin_Inkwell (SpeakerModel speakerModel){
      return InkWell(
        onTap: (){
          _launchURL(speakerModel.linkedinPath);
        },
        child: Row(
        children: <Widget>[
          Icon(
            Icons.link,
            color: Colors.black54,
          ),
         Expanded(
           child: Container(
               margin: EdgeInsets.only(left: 10.0),
               child: Text(
               speakerModel.linkedinPath,
               overflow: TextOverflow.ellipsis,
               style: TextStyle(
                   color: Colors.black54,
                   fontSize: 16.0
               ),
             )
           ),
         )
        ],
       )
     );
    } 

    Widget twitter_Inkwell (SpeakerModel speakerModel){
      return speakerModel.twitterUSer != null ? InkWell(
      onTap: (){
        _launchURL('https://twitter.com/'+speakerModel.twitterUSer);
      },
      child: Row(
      children: <Widget>[
        Container(
              margin: EdgeInsets.only(left: 4.0),
              width: 20.0,
              height: 20.0,
              decoration: BoxDecoration(
               image: DecorationImage(
                 image: AssetImage("assets/img/twitter.png")
               )
              ),
            ),
        Padding(
          padding: EdgeInsets.only(left: 10.0),
          child: Text(
            speakerModel.twitterUSer,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: Colors.black54,
              fontSize: 16.0
            ),
          )
        )
      ],
      )
     ): Container();
    }

    Widget informationContainer (SpeakerModel speakerModel){
      return Transform.translate(
        offset: Offset(0,-margin_xl),
        child: Container(
            margin: EdgeInsets.only(left: margin_m, right: margin_m),
            decoration: BoxDecoration(
                color: Colors.white,
                border: new Border .all(
                    color: Theme.of(context).dividerColor,
                    width: 1.0
                ),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: Colors.black38,
                      blurRadius: 10.0,
                      offset: Offset(0.0, 7.0)
                  )
                ],
                borderRadius: BorderRadius.all(Radius.circular(8.0))
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: margin_m, vertical: margin_m),
              child: Column(
                children: <Widget>[
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Información",
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: letter_xm,
                          fontWeight: FontWeight.bold
                      ),),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 8.0),
                    child: location_Text(speakerModel),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 8.0),
                    child: twitter_Inkwell(speakerModel),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 8.0),
                    child: linkedin_Inkwell(speakerModel),
                  ),
                ],
              ),
            )
        ),
      );
    } 

    Widget about_Text (SpeakerModel speakerModel){
       return Row(
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
             speakerModel.about,
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
    } 

    Widget aboutContainer (SpeakerModel speakerModel){
      return Transform.translate(
        offset: Offset(0, -margin_m),
        child: Container(
            margin: EdgeInsets.only(left: margin_m, right: margin_m, bottom: margin_m),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: Colors.black38,
                    blurRadius: 10.0,
                    offset: Offset(0.0, 7.0)
                )
              ],
              border: new Border .all(
                  color: Theme.of(context).dividerColor,
                  width: 1.0
              ),
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: margin_m, vertical: margin_m),
              child: Column(
                children: <Widget>[
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text("About",
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: letter_xm,
                          fontWeight: FontWeight.bold
                      ),),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 8.0),
                    child: about_Text(speakerModel),
                  )
                ],
              ),
            )
        ),
      );
    } 

    final arrowAppbar = InkWell(
      onTap: (){
        Navigator.pop(context);
      },
      child: Icon(
        Icons.arrow_back,
        color: Colors.white, 
      )
    );

  return FutureBuilder<SpeakerModel>(
    future: DBProvider.db.getSpeakerId(speakerId),
    builder: (BuildContext context, AsyncSnapshot<SpeakerModel> snapshot){

      if(!snapshot.hasData){
        return Center(child: CircularProgressIndicator());
      }

      SpeakerModel speaker = snapshot.data;

        return Scaffold(
          appBar: AppBar(
            elevation: 0.0,
          ),
          body: ListView(
            children: <Widget>[
              speakersAppBar(speaker),
              informationContainer(speaker),
              aboutContainer(speaker),
            ],
          ),
        );
    });
  }
}


