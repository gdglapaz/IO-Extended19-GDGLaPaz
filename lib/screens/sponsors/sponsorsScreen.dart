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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[sponsorCard("image", "SponsorName", "Sponsor Type"), SizedBox(width: 10.0), sponsorCard("image", "SponsorName", "Sponsor Type")]),
              SizedBox(height: 10.0),
              Row(mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[sponsorCard("image", "SponsorName", "Sponsor Type"), SizedBox(width: 10.0), sponsorCard("image", "SponsorName", "Sponsor Type")]),
              SizedBox(height: 10.0),
              Row(mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[sponsorCard("image", "SponsorName", "Sponsor Type"), SizedBox(width: 10.0), sponsorCard("image", "SponsorName", "Sponsor Type")]),
              SizedBox(height: 10.0),
              Row(
                children: <Widget>[sponsorCard("image", "SponsorName", "Sponsor Type")]),
            ],
          ),
        ),
      )
    );
  }

  Widget sponsorCard(String sponsorImage, String sponsorName, String sponsorType) {
    return Container(
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, style: BorderStyle.solid, width: 2.0),
        borderRadius: BorderRadius.circular(10.0)
      ),
      child: Column(
        children: <Widget>[
          Container(
            width: 80.0,
            height: 80.0,
            margin: EdgeInsets.all(2.0),
            child: CircleAvatar(
              backgroundImage: AssetImage("assets/img/gdelogo.jpeg"),
            ),
          ),
          SizedBox(height: 5.0),
          Text(sponsorName, style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 20.0),),
          SizedBox(height: 2.0),
          Text(sponsorName, style: TextStyle(fontWeight: FontWeight.normal, fontSize: 14.0),),
        ],
      ),
    );
  }

}