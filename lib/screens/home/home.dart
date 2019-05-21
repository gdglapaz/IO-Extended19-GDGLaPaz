import 'package:flutter/material.dart';
import 'package:io_extended_gdglapaz/screens/codelabs/codelabs.dart';
import 'package:io_extended_gdglapaz/util/palette_utils.dart';
import 'package:io_extended_gdglapaz/screens/techtalks/techtalks.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.menu
        ),
        title: Text("I/O Extended"),
        actions: <Widget>[
          Container(
            width: 50.0,
            height: 50.0,
            margin: EdgeInsets.all(2.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage("https://www.websa100.com/wp-content/uploads/2016/05/foto-en-blanco-y-negro.png"),
            ),
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
