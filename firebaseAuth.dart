//here will be the code snippets of firebase auth
import 'package:book_store/Screens/Home/mainPage.dart';
import 'package:book_store/Screens/Registration/login.dart';
import 'package:book_store/Screens/Registration/verifyEmail.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthClass {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  final storage = new FlutterSecureStorage();

//Sign in with email
  Future<void>? signInWithEmail(
      {required String email,
      required String password,
      required BuildContext context}) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      User? user = _auth.currentUser;
      if (user != null && !user.emailVerified) {
        showSnackBar(context, 'Email was not verified');
        await user.sendEmailVerification();

        Navigator.pushNamed(context, VerifyEmail.routeName,
            arguments: VerifyEmailArguments(email));
      } else {
        Navigator.pushNamedAndRemoveUntil(
            context, MainPage.routeName, (route) => false);
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        showSnackBar(context, 'No user found for that email.');
      } else if (e.code == 'wrong-password') {
        showSnackBar(context, 'Wrong password provided for that user.');
      }
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

//Sign up with Email
  Future<void>? signUpWithEmail(
      {required String email,
      required String password,
      required String confirmPassword,
      required BuildContext context}) async {
    if (password == confirmPassword) {
      try {
        UserCredential userCredential = await _auth
            .createUserWithEmailAndPassword(email: email, password: password);
        print(userCredential.user!.uid);
        User? user = _auth.currentUser;
        var uid = _auth.currentUser!.uid;

        if (user != null && !user.emailVerified) {
          await user.sendEmailVerification();
        }

        // storeTokenAndData(userCredential);

        Navigator.pushNamed(context, VerifyEmail.routeName,
            arguments: VerifyEmailArguments(email));
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          showSnackBar(context, 'Password should atleast be of 6 characters');
        } else if (e.code == 'email-already-in-use') {
          User? user = _auth.currentUser;
          if (user != null && !user.emailVerified) {
            showSnackBar(context,
                'This email is already taken please login, (Email verification required)');
          } else {
            showSnackBar(context, 'This email is already taken');
          }
        }
      } catch (e) {
        showSnackBar(context, e.toString());
      }
    } else {
      showSnackBar(context, "Passwords didn't matched");
    }
  }

// Reset Password
  Future<void> resetPassword(
      {required String email, required BuildContext context}) async {
    try {
      await _auth.sendPasswordResetEmail(
        email: email,
      );
      showModalSheet(context,
          'A password reset link has been sent to your mail. Please reset your password there and login back again');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-email') {
        showSnackBar(context, 'Invalid email address');
      } else if (e.code == 'user-not-found') {
        showSnackBar(context, 'No user found with this email address');
      }
    }
  }

//Google sign In
  Future<void> googleSignIn(BuildContext context) async {
    try {
      GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();
      GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount!.authentication;
      AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );
      UserCredential userCredential =
          await _auth.signInWithCredential(credential);
      storeTokenAndData(userCredential);
      Navigator.pushNamedAndRemoveUntil(
          context, MainPage.routeName, (route) => false);
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  Future<String?> googleSignIn1(BuildContext context) async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount!.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );
      await _auth.signInWithCredential(credential);
      Navigator.pushNamedAndRemoveUntil(
          context, MainPage.routeName, (route) => false);
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.toString());
      print(e.message);
      throw e;
    }
  }

  //Sign Out
  Future<void> signOut({required BuildContext context}) async {
    try {
      await _googleSignIn.signOut();
      await _auth.signOut();
      await storage.delete(key: "token");
      Navigator.pushNamedAndRemoveUntil(
          context, LoginScreen.routeName, (route) => false);
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  void storeTokenAndData(UserCredential userCredential) async {
    print("storing token and data");
    await storage.write(
        key: "token", value: userCredential.credential!.token.toString());
    await storage.write(
        key: "usercredential", value: userCredential.toString());
  }

  Future<String?> getToken() async {
    return await storage.read(key: "token");
  }

  void showSnackBar(BuildContext context, String text) {
    final snackBar = SnackBar(content: Text(text));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}

void showModalSheet(BuildContext context, String text) {
  showModalBottomSheet<void>(
    context: context,
    builder: (BuildContext context) {
      return Container(
        height: 200,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                text,
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                child: const Text('Ok'),
                onPressed: () => Navigator.pop(context),
              )
            ],
          ),
        ),
      );
    },
  );
}
