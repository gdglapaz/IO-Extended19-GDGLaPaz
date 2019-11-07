import 'package:flutter/material.dart';
import 'package:io_extended_gdglapaz/shared_preferences/user_preferences.dart';
import 'package:io_extended_gdglapaz/widgets/userProfile.dart';
import 'package:io_extended_gdglapaz/util/ui_utils.dart';

class Menu extends StatefulWidget {
  @override
  _MenuState createState() => new _MenuState();
}

class _MenuState extends State<Menu> {

  Drawer getDrawer(BuildContext context){
    
    ListTile getItem(Icon icon, String description, String route){
      return new ListTile(
         leading: icon,
         title: new Text(description),
         onTap: (){
           Navigator.pushNamed(context, route);
         },
      );
    }
  
    ListView listView= new ListView(
      padding: EdgeInsets.zero,
      children:  <Widget>[
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
        getItem(new Icon(Icons.people), 'Sponsors', "sponsors"),
        getItem(new Icon(Icons.info_outline), 'About Us', "about-us"),
        getItem(new Icon(Icons.insert_emoticon), 'Puntos GDG', "points"),
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