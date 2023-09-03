import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lighty_chat/constants.dart';
import 'package:lighty_chat/roundedButton.dart';
import 'package:lighty_chat/screens/chat_screen.dart';
import 'package:loading_overlay/loading_overlay.dart';

class LoginScreen extends StatefulWidget {
  static String id = "login_screen";
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String? email;
  String? passowrd;

  ///String? name;
  final _auth = FirebaseAuth.instance;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: LoadingOverlay(
        isLoading: isLoading,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Hero(
                tag: "logo",
                child: Container(
                  height: 200.0,
                  child: Image.asset('images/logo.png'),
                ),
              ),
              SizedBox(
                height: 48.0,
              ),
              TextField(
                onChanged: (value) {
                  email = value;
                },
                decoration: kInputFieldDecoration.copyWith(
                    hintText: "Enter your Email"),
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                obscureText: true,
                onChanged: (value) {
                  passowrd = value;
                },
                decoration:
                    kInputFieldDecoration.copyWith(hintText: "Enter Password"),
              ),
              SizedBox(
                height: 24.0,
              ),
              RoundedButton(
                text: "Login",
                color: Colors.blueAccent,
                onPressed: () {
                  Login();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void Login() async {
    //final newUser=_auth.
    try {
      setState(() {
        isLoading = true;
      });
      final user = await _auth.signInWithEmailAndPassword(
          email: email ?? "", password: passowrd ?? "");
      if (user != null) {
        setState(() {
          isLoading = false;
        });
        Navigator.pushNamed(context, ChatScreen.id);
      }
    } catch (e) {
      print(e);
    }
  }
}
