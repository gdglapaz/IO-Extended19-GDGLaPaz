//import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:io_extended_gdglapaz/screens/codelabs/codelabs.dart';
import 'package:io_extended_gdglapaz/screens/techtalks/techtalks.dart';
import 'package:io_extended_gdglapaz/services/auth.dart';
import 'package:io_extended_gdglapaz/shared_preferences/user_preferences.dart';
import 'package:io_extended_gdglapaz/widgets/menu.dart';
//import 'package:cached_network_image/cached_network_image.dart';
import 'package:io_extended_gdglapaz/widgets/userProfile.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int currentIndex = 0;
  //final prefs = UserPreferences();
  //final auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Menu(),
      appBar: AppBar(
        title: Text("DevFest19"),
      ),
      body: _callPage(currentIndex),
      bottomNavigationBar: _createBottomNavigationBar(),
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
