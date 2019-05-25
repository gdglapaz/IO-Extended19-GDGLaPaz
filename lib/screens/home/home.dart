import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:io_extended_gdglapaz/screens/codelabs/codelabs.dart';
import 'package:io_extended_gdglapaz/screens/techtalks/techtalks.dart';
import 'package:io_extended_gdglapaz/services/auth.dart';
import 'package:io_extended_gdglapaz/shared_preferences/user_preferences.dart';
import 'package:io_extended_gdglapaz/widgets/menu.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:io_extended_gdglapaz/widgets/userProfile.dart';

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
            child: InkWell(
              onTap: (){
                _showDialog();
              },
              child: UserProfile(),
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

  Future<void> _showDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  UserProfile(),
                  Text("Bienvenido!")
                ],
              ),
              Divider(height: 5.0,)
            ],
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                prefs.uid == null ? Text(
                  'Inicia sesión para reservar codelabs, hacer preguntas, ganar puntos y canjearlos en la tienda habilitada el día del evento (si es un asistente).',
                  style: TextStyle(
                    color: Colors.black54
                  ),
                )
                : Text(
                  "Todos tus codelabs reservados y puntos ganados permanecerán sincronizados con tu cuenta.",
                  style: TextStyle(
                      color: Colors.black54
                  ),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Cancelar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            prefs.uid == null ? FlatButton(
              child: Text('Iniciar Sesión'),
              onPressed: () {
                auth.handleSignIn();
                Navigator.of(context).pop();
              },
            ) : FlatButton(
              child: Text('Cerrar Sesión'),
              onPressed: () {
                auth.signOut();
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
