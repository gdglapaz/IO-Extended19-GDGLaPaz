import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:io_extended_gdglapaz/services/firebase_functions.dart';
import 'package:io_extended_gdglapaz/shared_preferences/user_preferences.dart';
import 'package:io_extended_gdglapaz/util/ui_utils.dart';

class UserProfile extends StatefulWidget {

  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  UserPreferences prefs = UserPreferences();

  double sizeAvatar = 40.0;
  int sumSponsors = 0;
  @override
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(margin_s),
      child: Stack(
        children: <Widget>[
          ClipOval(
            child: CachedNetworkImage(
              imageUrl:  prefs.photoUrl,
              width: sizeAvatar,
              height: sizeAvatar,
              fit: BoxFit.fill,
            ),
          ),
          FutureBuilder<int>(
              future: getUserPoints(),
              builder: (BuildContext context, AsyncSnapshot<int> snapshot){

                if(!snapshot.hasData){
                  return CircularProgressIndicator();
                }
                else{
                  return Positioned(
                    bottom: 0.0,
                    right: 0.0,
                    child: Container(
                      width: 20.0,
                      height: 20.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.amber
                      ),
                      child: Center(
                        child: Text(
                            snapshot.data.toString(),
                            style: TextStyle(
                              fontSize: 11.0
                            ),
                        ),
                      ),
                    ),
                  );
                }
              }
          ),
        ],
      ),
    );
  }

  Future<int> getUserPoints() async{
    int sumSponsors = 0;

    await FirebaseFunctions()
        .getUserPoints("marco_leonardini@hotmail.com")
        .then((QuerySnapshot docs){
          if(docs.documents.isNotEmpty) {

            int sumStudyGroups = 0;
            if(docs.documents[0].data["grupo_estudio"].length > 0){
              var studyGroups = docs.documents[0].data["grupo_estudio"].values;
              sumStudyGroups = studyGroups.reduce((sum, element) => sum + element);
            }

            if(docs.documents[0].data["sponsors"].length > 0){
              var sponsors = docs.documents[0].data["sponsors"].values;
              sumSponsors = sponsors.reduce((sum, element) => sum + element);
            }
            sumSponsors = sumSponsors + sumStudyGroups;
          }
    });

    return sumSponsors;
  }
}
