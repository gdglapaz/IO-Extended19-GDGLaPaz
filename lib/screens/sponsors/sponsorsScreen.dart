import 'package:flutter/material.dart';

class SponsorsScreen extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Nuestros Sponsors")
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Wrap(
            children: <Widget>[
              sponsorCard("assets/img/sponsors/ucb.png", "Universidad Catolica Boliviana", "Ambiente"),
              sponsorCard("assets/img/sponsors/jalasoft.png", "Jalasoft", "Apoyo del Evento"),
              sponsorCard("assets/img/sponsors/comtec.png", "Comtec", "Apoyo del Evento"),
              sponsorCard("assets/img/sponsors/kaspersky.jpeg", "Kaspersky", "Apoyo del Evento"),
              sponsorCard("assets/img/sponsors/datec.png", "Datec", "Apoyo del Evento"),
              sponsorCard("assets/img/sponsors/piu.png", "Intervenciones Urbanas", "Apoyo del Evento"),
              sponsorCard("assets/img/sponsors/mpd.png", "Ministerio de planificación del Desarrollo", "Apoyo del Evento"),
            ],
          ),
        ),
      )
    );
  }

  Widget sponsorCard(String sponsorImage, String sponsorName, String sponsorType) {
    return Container(
      width: 155.0,
      height: 200.0,
      padding: EdgeInsets.all(10.0),
      margin: EdgeInsets.only(bottom: 10.0, left: 5.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, style: BorderStyle.solid, width: 2.0),
        borderRadius: BorderRadius.circular(10.0)
      ),
      child: Column(
        children: <Widget>[
          Container(
            width: 80.0,
            height: 80.0,
            color: Colors.white,
            margin: EdgeInsets.all(2.0),
            child: Image.asset(sponsorImage)
          ),
          SizedBox(height: 5.0),
          Text(sponsorName, style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 18.0), textAlign: TextAlign.center,),
          SizedBox(height: 2.0),
          Text(sponsorType, style: TextStyle(fontWeight: FontWeight.normal, fontSize: 14.0),),
        ],
      ),
    );
  }

}