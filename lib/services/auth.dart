import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<FirebaseUser> handleSignIn() async {
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final FirebaseUser user = await _auth.signInWithCredential(credential);
    updateUser(user);
    return user;
  }

  void updateUser(FirebaseUser user)  async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('uid', user.uid);
    prefs.setString('email', user.email);
    prefs.setString('photoUrl', user.photoUrl);
    prefs.setString('displayName', user.displayName);
  }

  void signOut(){
    _auth.signOut();
  }
}

final AuthService authService = AuthService();