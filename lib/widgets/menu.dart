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
    var about = new AboutListTile(
      child: new Text("About Us"),
      applicationName: "Informacion App",
      applicationIcon: new Icon(Icons.favorite),
      icon: new Icon(Icons.info),
    );
    
    var usAccounts = new UserAccountsDrawerHeader(
      accountName: new Text("Full Name",textAlign: TextAlign.center),
      accountEmail: new Text("Im_prueba@gmail.com",textAlign: TextAlign.center),
      currentAccountPicture: imagen
    );
    
    
  ListTile getItem(Icon icon, String description, String route){
    return new ListTile(
       leading: icon,
       title: new Text(description),
       onTap: (){
         setState(() {
          Navigator.of(context).pushNamed(route);
         });
       },
    );
  }
  
  ListView listView= new ListView(
    children:  <Widget>[
      usAccounts,
    getItem(new Icon(Icons.home), 'Home', "/"),
    getItem(new Icon(Icons.speaker), 'Speakers', "/"),
    getItem(new Icon(Icons.location_on), 'Location', "/"),
    getItem(new Icon(Icons.forum), 'Forum', "/"),
    about

    ]);
    return new Drawer(
      child: listView,
    );}
  @override
  Widget build(BuildContext context) {
   return new Drawer(
      child: getDrawer(context)
   );
  }
}