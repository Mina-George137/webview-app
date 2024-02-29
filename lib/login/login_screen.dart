import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controllers/signin_controller.dart';
import 'login_button.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = 'login_screen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  // Future<void> _signInWithGoogle() async {
  //   try {
  //     final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
  //     if (googleUser != null) {
  //       // Handle successful Google login here
  //       print('Signed in with Google: ${googleUser.email}');
  //     }
  //   } catch (error) {
  //     print(error);
  //   }
  // }

  // Future<void> _signInWithFacebook() async {
  //   final LoginResult loginResult = await FacebookAuth.instance.login();
  //   if (loginResult.status == LoginStatus.success) {
  //     // Handle successful Facebook login here
  //     final FacebookAccessToken accessToken = loginResult.accessToken;
  //     print('Signed in with Facebook: $accessToken');
  //   } else {
  //     print(loginResult.message);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    final signInController = Provider.of<SignInController>(context);

    return ChangeNotifierProvider<SignInController>(
      create:(context) => SignInController() ,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Login',style: TextStyle(color: Colors.white),),
          centerTitle: true,
          backgroundColor: Colors.black,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LoginButton(bkg: Colors.red,icn: Icons.g_mobiledata_outlined ,onPressed:signInController.googleLogin(context) ,textColor: Colors.white ,textStr: 'Sign in with Google' ,),

              SizedBox(height: 20),
              LoginButton(bkg: Colors.indigo,icn: Icons.facebook ,onPressed:signInController.googleLogin(context) ,textColor: Colors.white ,textStr: 'Sign in with Facebook' ,),

            ],
          ),
        ),
      ),
    );
  }
}
