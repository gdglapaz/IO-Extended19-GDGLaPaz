import 'package:flutter/material.dart';
import 'package:io_extended_gdglapaz/shared_preferences/user_preferences.dart';
import 'package:io_extended_gdglapaz/widgets/userProfile.dart';
import 'package:io_extended_gdglapaz/util/ui_utils.dart';

class Menu extends StatefulWidget {
  @override
  _MenuState createState() => new _MenuState();
}

class _MenuState extends State<Menu> {
  final prefs = UserPreferences();
  Drawer getDrawer(BuildContext context){
    
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
        prefs.uid != null ? UserAccountsDrawerHeader(
            accountName: new Text(prefs.displayName,textAlign: TextAlign.center),
            accountEmail: new Text(prefs.email,textAlign: TextAlign.center),
            currentAccountPicture: UserProfile()
        ) :
        DrawerHeader(
          child: Container(
            padding: EdgeInsets.all(margin_m),
            child: Image.asset("assets/img/io_ext_lapaz.png"),
          ),
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
          ),
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