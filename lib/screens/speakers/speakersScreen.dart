import 'package:flutter/material.dart';
import 'package:io_extended_gdglapaz/providers/db_provider.dart';
import 'package:io_extended_gdglapaz/widgets/speakerItem.dart';
import 'package:io_extended_gdglapaz/widgets/menu.dart';

class SpeakersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<SpeakerModel>>(
        future: DBProvider.db.getAllSpeakers(),
        builder: (BuildContext context, AsyncSnapshot<List<SpeakerModel>> snapshot){

        if(!snapshot.hasData){
          return Scaffold();
        }

        final speakers = snapshot.data;

        return Scaffold(
          drawer: Menu(),
          appBar: new AppBar(title: new Text("Speakers"),),
          body: ListView.builder(
            itemCount: speakers.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                child: Padding(padding: const EdgeInsets.all(16.0),
                  child: SpeakerItem(speakers[index].id_speaker, speakers[index].pathImage,
                      speakers[index].firstName, speakers[index].lastName, speakers[index].jobTitle),
                ) //child: Text(speakers[index].firstName),
              );
            }
          )
        );
    });
           
      

  }}