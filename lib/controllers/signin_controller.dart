
import 'package:easaac_project/home/home.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../userModel.dart';

class SignInController with ChangeNotifier {
  // object

  var _googleSignIn = GoogleSignIn();
  GoogleSignInAccount? googleSignInAccount;
  UserDetails? userDetails;
// function for google login
  googleLogin(BuildContext context) async {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen(url: '',)));

    this.googleSignInAccount = await _googleSignIn.signIn();
// inserting values to our user details model
    this.userDetails = UserDetails(
      displayName: this.googleSignInAccount!.displayName,
      email: this.googleSignInAccount!.email,
      photoURL: this.googleSignInAccount!.photoUrl,
    );
    print(this.userDetails);
// call
    notifyListeners();
  }

// logout
  logout() async {
    this.googleSignInAccount = await _googleSignIn.signOut();
    userDetails = null;
    notifyListeners();
  }
}
