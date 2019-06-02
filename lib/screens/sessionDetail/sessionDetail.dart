import 'package:flutter/material.dart';
import 'package:io_extended_gdglapaz/screens/speakerDetail/speakerDetail.dart';
import 'package:io_extended_gdglapaz/util/ui_utils.dart';
import 'package:io_extended_gdglapaz/widgets/chipList.dart';
import 'package:io_extended_gdglapaz/providers/db_provider.dart';
import 'package:io_extended_gdglapaz/widgets/speakerItem.dart';

class Sessiondetail extends StatelessWidget{

  int sessionId;

  Sessiondetail(this.sessionId);

  @override
  Widget build(BuildContext context) {

    Widget sessionDetailAppbar(List<Map<dynamic, dynamic>> sessionDetail, int id){
        return Container(
          height: 150.0,
          color: Theme.of(context).primaryColor,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(
                  margin: EdgeInsets.all(margin_m),
                  child: (sessionDetail[id]['type'] == 'T' ? Image.asset("assets/img/techtalks.png"): Image.asset("assets/img/codelabs.png")),
                ),
              ),
              Expanded(
                flex: 8,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      sessionDetail[id]['title'],
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: Colors.white,
                            fontSize: letter_x,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(margin_xs),
                      child: Text(
                        sessionDetail[id]['date'],
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: letter_m,
                            fontWeight: FontWeight.w300
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(margin_xs),
                      child: Text(
                        sessionDetail[id]['time'],
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: letter_md,
                            fontWeight: FontWeight.w600
                        ),
                      )
                    )
                  ],
                ),
              )
            ],
          )
      );
    }

    Widget speakerContainer (List<Map<dynamic, dynamic>> sessionDetail){
      return InkWell(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => SpeakerDetailScreen(sessionId)));
          },
          child: sessionDetail[0]["id_speaker"] != null ? Container(
            height: 120.0,
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
                SpeakerItem(sessionDetail[0]["id_speaker"],sessionDetail[0]["pathImage"],sessionDetail[0]["firstName"],sessionDetail[0]["lastName"],sessionDetail[0]["jobTitle"])
              ],
            ),
            )
          ) : Container()
        );
    }

    Widget sessionDescription (List<Map<dynamic, dynamic>> sessionDetail, int id){
      return Container(
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
           Container(
             margin: EdgeInsets.only(bottom: margin_s, top: margin_s),
             width: 300.0, height: 35.0, child: ChipList(sessionId)
           ),
           Container(
               padding: EdgeInsets.all(5.0),
               child: Text(
                 sessionDetail[id]['description'],
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
    } 

    final commentsButton = Container(
      child: FloatingActionButton(
        onPressed: null,
        child: Icon(Icons.question_answer),
      ),
    );

    Widget myScreen (List<Map<dynamic, dynamic>> sessionDetail, int id){
        return Scaffold(
          appBar: AppBar(
            elevation: 0.0,
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              sessionDetailAppbar(sessionDetail, id),
              speakerContainer(sessionDetail),
              sessionDescription(sessionDetail, id),
            ],
          )
        );
    }

    return FutureBuilder<List<Map>>(
        future: DBProvider.db.getSessionDetailById(sessionId),
        builder: (BuildContext context, AsyncSnapshot<List<Map>> snapshot){
          if(!snapshot.hasData){
            return Center(child: CircularProgressIndicator(),);
          }

          final sessionDetail = snapshot.data;   

          return Scaffold(
            body: myScreen(sessionDetail, 0),
          );
        }
    );
  }
}