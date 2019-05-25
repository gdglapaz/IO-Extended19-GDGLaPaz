import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:io_extended_gdglapaz/screens/codelabs/codelabs.dart';
import 'package:io_extended_gdglapaz/screens/techtalks/techtalks.dart';
import 'package:io_extended_gdglapaz/services/auth.dart';
import 'package:io_extended_gdglapaz/shared_preferences/user_preferences.dart';
import 'package:io_extended_gdglapaz/widgets/menu.dart';
import 'package:cached_network_image/cached_network_image.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int currentIndex = 0;
  final prefs = UserPreferences();
  final auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Menu(),
      appBar: AppBar(
        title: Text("I/O Extended"),
        actions: <Widget>[
          Container(
            width: 50.0,
            height: 50.0,
            margin: EdgeInsets.all(2.0),
            child: InkWell(
              onTap: (){
                auth.handleSignIn()
                    .then((FirebaseUser user) => {
                      setState(() {})
                    })
                    .catchError((e) => print(e));
              },
              child: CachedNetworkImage(
                  imageUrl:  prefs.photoUrl,
                ),
            )
          )
        ],
      ),
      body: _callPage(currentIndex),
      bottomNavigationBar: _createBottomNavigationBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        child: Icon(
            Icons.question_answer
        ),
        backgroundColor: Theme.of(context).primaryColor,
      ),
    );
  }

  Future<void> _neverSatisfied() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text("Bienvenido!"),
                  Text("Bienvenido!")
                ],
              ),
              Divider(height: 5.0,)
            ],
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('You will never be satisfied. You will never be satisfied. You will never be satisfied. You will never be satisfied.'),
                Text('You\’re like me. I’m never satisfied.'),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Regret'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Widget _callPage( int actualPage ){
    switch( actualPage ){
      case 0: return TechtalksScreen();
      case 1: return CodelabsScreen();

      default:
        return TechtalksScreen();
    }
  }

  Widget _createBottomNavigationBar(){
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (index){
        setState(() {
          currentIndex = index;
        });
      },
      items: [
        BottomNavigationBarItem(
            icon: Icon(Icons.record_voice_over),
            title: Text("Techtalks")
        ),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.computer,
            ),
            title: Text("Codelabs")
        )
      ],
    );
  }
}
