import 'package:flutter/material.dart';
import 'package:io_extended_gdglapaz/util/ui_utils.dart';
import 'package:qrcode_reader/qrcode_reader.dart';

class PointsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Puntos GDG"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              instructions(),
              SizedBox(height: 20.0),
              Text(
                "Tu puntaje:",
                 style:
                 TextStyle(
                   color: Theme.of(context).primaryColor,
                   fontSize: letter_md,
                   fontWeight: FontWeight.bold 
                 )    
              ),     
              scoreSection(context),
              Text(
                "Premios!:",
                 style:
                 TextStyle(
                   color: Theme.of(context).primaryColor,
                   fontSize: letter_md,
                   fontWeight: FontWeight.bold 
                 )    
              ),
              SizedBox(height: 20.0,),
              prizesList() 
            ],
          ),
        ),
      )
    );
  }

  Widget instructions() {
    return Column(
      children: <Widget>[
        Text(
          "Obten increibles premios canjeando tus puntos ganados!, responde preguntas en el evento y gana puntos!",
          style: TextStyle(fontSize: letter_md, color: Colors.black54),
        ),
        SizedBox(height: 10.0,),
        Text(
          "Para ver cuantos puntos obtuviste escanea tu código QR con nuestro lector.",
          style: TextStyle(fontSize: letter_md, color: Colors.black54),
        )
      ],
    );
  }



  Widget scoreSection(context) {
    return Center(
      child: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            Text(
              "Tu puntaje es:",
              style:
              TextStyle(
                color: Colors.black54,
                fontSize: letter_md,
                fontWeight: FontWeight.bold 
              )    ,
            ),
            SizedBox(height: 20.0,),
            coinScore(),
            SizedBox(height: 20.0,),
            InkWell(
              child: Container(
                height: 60.0,
                width: 130.0,
                child: Center(child: Text("Escanear QR", style: TextStyle(color: Theme.of(context).primaryColor, fontSize: letter_md),)),
                decoration: BoxDecoration(
                  border: Border.all(width: 2.0, color: Theme.of(context).primaryColor),
                  borderRadius: BorderRadius.circular(5.0)
                ),
              ),
              onTap: _scanQR,
            )
          ],
        ),
      )
    );
  }

  Widget coinScore() {
    return Container(
      height: 150.0,
      width: 150.0,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/img/coin.png')
        )
      ),
      child: Center(child: Text("50 puntos", style: TextStyle(color: Colors.white, fontSize: letter_md, fontWeight: FontWeight.bold)))
    );
  }

  Widget prizesList() {
    return Center(
      child: Wrap(
        verticalDirection: VerticalDirection.down,
        children: <Widget>[
          prizeCard("assets/img/prizes/stkCloud.png", "Sticker Cloud", "? Puntos"),
          prizeCard("assets/img/prizes/stkDash.png", "Sticker Dash", "? Puntos"),
          prizeCard("assets/img/prizes/stkTensorflow.png", "Sticker TensorFlow", "? Puntos"),
          prizeCard("assets/img/prizes/stkDino.png", "Sticker Dino", "? Puntos"),
          prizeCard("assets/img/prizes/stkAngular.png", "Sticker Angular", "? Puntos"), 
          prizeCard("assets/img/prizes/stkFirebase.png", "Sticker Firebase", "? Puntos"),
          prizeCard("assets/img/prizes/gorraTech.png", "Gorra Tech", "? Puntos"),
          prizeCard("assets/img/prizes/polera.png", "Polera Devfest", "? Puntos"),
        ],
      ),
    );
  }

  Widget prizeCard(String prizeImage, String prizeName, String pointsToGet) {
    return Container(
      width: 140.0,
      height: 200.0,
      margin: EdgeInsets.only(bottom: 10.0, right: 5.0),
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, style: BorderStyle.solid, width: 2.0),
        borderRadius: BorderRadius.circular(10.0)
      ),
      child: Column(
        children: <Widget>[
          Container(
            width: 100.0,
            height: 100.0,
            margin: EdgeInsets.all(2.0),
            child: Image.asset(prizeImage)
            // color: Colors.blue,
          ),
          SizedBox(height: 5.0),
          Text(prizeName, style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 20.0),textAlign: TextAlign.center,),
          SizedBox(height: 2.0),
          Text(pointsToGet, style: TextStyle(fontWeight: FontWeight.normal, fontSize: 14.0),),
        ],
      ),
    );
  }

  Future<String> _scanQR() async {
    String futureString = '';

    try {
      futureString = await new QRCodeReader().scan();
    } catch (e) {
      print(e);
    }

    if(futureString != null) {
      print(futureString);
    }

  }

}