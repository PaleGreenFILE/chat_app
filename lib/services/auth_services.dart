// ignore_for_file: empty_catches
import 'package:chat_app/config/shared_prefHelper.dart';
import 'package:chat_app/pages/home.dart';
import 'package:chat_app/pages/login%20copy.dart';
import 'package:chat_app/pages/welcome_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'db_services.dart';

class AuthServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String? uid;
  getCurrentUser() {
    return _auth.currentUser;
  }

  signInWithGoogle(BuildContext context, String text) async {
    final FirebaseAuth _firebaseauth = FirebaseAuth.instance;
    final GoogleSignIn _googleSignIn = GoogleSignIn();

    final GoogleSignInAccount? googleSignInAccount =
        await _googleSignIn.signIn();

    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount!.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken);

    UserCredential result =
        await _firebaseauth.signInWithCredential(credential);

    User userDetails = result.user!;

    // ignore: unnecessary_null_comparison
    if (result != null) {
      SharedPreferenceHelper().saveUserEmail(userDetails.email!);
      SharedPreferenceHelper().saveUserId(userDetails.uid);
      SharedPreferenceHelper().saveDisplayName(userDetails.displayName!);
      SharedPreferenceHelper().saveProfileUrl(userDetails.photoURL!);

      Map<String, dynamic> userInfoMap = {
        "email": userDetails.email,
        "username": userDetails.email!.replaceAll("@gmail.com", ""),
        "name": userDetails.displayName,
        "imgUrl": userDetails.photoURL
      };
      DBServices()
          .addUserInfoToDB(userDetails.uid, userInfoMap)
          .then((value) => {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => HomePage()))
              });
    }
  }

  void singIn(context, String email, String password) async {
    try {
      await _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) => {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomePage())),
              });
    } catch (e) {
      errorBox(context, e);
    }
  }

  void resetpassword(context, String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } catch (e) {
      errorBox1(context, e);
    }
  }

  void singUp(context, String name, String email, String password) async {
    try {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) => {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SocialPage())),
              });
    } catch (e) {
      errorBox(context, e);
    }
  }

  User get user => FirebaseAuth.instance.currentUser!;

  Stream<User?> get onChangedUser => _auth.authStateChanges();

  void signOut(context) async {
    try {
      await _auth.signOut().then((value) => {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const WelcomePage()),
                (route) => false)
          });
    } catch (e) {
      errorBox(context, e);
    }
  }

  errorBox(context, e) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
              title: const Text("Erreur:"), content: Text(e.toString()));
        });
  }

  succesBox(context, e) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
              title: const Text("Succes:"), content: Text(e.toString()));
        });
  }

  errorBox1(context, e) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Envoyer:"),
            content: Text(e.toString()),
          );
        });
  }
}
