/**import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  static final UserPreferences _instancia = UserPreferences._internal();

  factory UserPreferences(){
    return _instancia;
  }

  UserPreferences._internal();

  SharedPreferences _prefs;

  initPreferences() async{
    this._prefs = await SharedPreferences.getInstance();
  }

  get uid{
    return _prefs.getString("uid") ?? null;
  }

  get email{
    return _prefs.getString("email") ?? null;
  }

  get photoUrl{
    return _prefs.getString("photoUrl") ?? "https://cdn.shopify.com/s/files/1/2805/6822/files/usericon_id76rb_large.png";
  }

  get displayName{
    return _prefs.getString("displayName") ?? null;
  }

  void updateUser(FirebaseUser user){
    _prefs.setString('uid', user.uid);
    _prefs.setString('email', user.email);
    _prefs.setString('photoUrl', user.photoUrl);
    _prefs.setString('displayName', user.displayName);
  }

  void removeUser(){
    _prefs.setString('uid', null);
    _prefs.setString('email', null);
    _prefs.setString('photoUrl', null);
    _prefs.setString('displayName', null);
  }
}*/