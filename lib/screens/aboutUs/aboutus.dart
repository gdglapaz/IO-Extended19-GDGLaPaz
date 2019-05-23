import 'package:flutter/material.dart';
class AboutUsScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp (
      title: "About Us",
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.purpleAccent[700],
            leading: Icon(Icons.arrow_back, color: Colors.white,),
            title: Text('About Us'),
          ),
          body: Center(//container
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[

                  SizedBox(
                    width: 200.0,
                    child:  Image.network ('https://secure.meetupstatic.com/photos/event/d/9/5/1/600_481435633.jpeg'),
                  ),
                  SizedBox(height: 12.0,),
                  SizedBox(
                    width: 350.0,
                    child: Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit,'
                        ' sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'
                        ' Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris'
                        ' nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in'
                        ' reprehenderit in voluptate velit esse cillum dolore eu fugiat'
                        ' nulla pariatur. Excepteur sint occaecat cupidatat non proident, '
                        'sunt in culpa qui officia deserunt mollit anim id est laborum.',
                        textAlign: TextAlign.justify,),
                  ),
                 ],

              )
          )
      ),
    );
  }
}
