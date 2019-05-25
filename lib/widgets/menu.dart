import 'package:flutter/material.dart';
class Menu extends StatefulWidget {
  @override
  _MenuState createState() => new _MenuState();
 }
class _MenuState extends State<Menu> {
  Drawer getDrawer(BuildContext context){
    var imagen = new CircleAvatar(
      backgroundImage: NetworkImage(
        "https://www.websa100.com/wp-content/uploads/2016/05/foto-en-blanco-y-negro.png"));
    
    ListTile getItem(Icon icon, String description, String route){
      return new ListTile(
         leading: icon,
         title: new Text(description),
         onTap: (){
           Navigator.pushReplacementNamed(context, route);
         },
      );
    }
  
    ListView listView= new ListView(
      padding: EdgeInsets.zero,
      children:  <Widget>[
        UserAccountsDrawerHeader(
            accountName: new Text("Full Name",textAlign: TextAlign.center),
            accountEmail: new Text("Im_prueba@gmail.com",textAlign: TextAlign.center),
            currentAccountPicture: imagen
        ),
        getItem(new Icon(Icons.home), 'Home', "home"),
        getItem(new Icon(Icons.record_voice_over), 'Speakers', "speakers"),
        getItem(new Icon(Icons.location_on), 'Location', "home"),
        getItem(new Icon(Icons.forum), 'Forum', "home"),
        getItem(new Icon(Icons.people), 'About Us', "about-us"),
      ]
    );

    return new Drawer(
      child: listView,
    );
  }

  @override
  Widget build(BuildContext context) {
   return new Drawer(
      child: getDrawer(context)
   );
  }
}