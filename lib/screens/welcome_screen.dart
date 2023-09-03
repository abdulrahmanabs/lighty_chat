import 'package:flutter/material.dart';
import 'package:lighty_chat/roundedButton.dart';
import 'package:lighty_chat/screens/login_screen.dart';
import 'package:lighty_chat/screens/registration_screen.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class WelcomeScreen extends StatefulWidget {
  static String id = "welcome_scree";
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController animController;
  late Animation bgColorAnim;
  @override
  void initState() {
    // TODO: implement initState
    animController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 650));
    bgColorAnim = ColorTween(begin: Colors.orangeAccent, end: Colors.white)
        .animate(animController);
    animController.forward();
    animController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColorAnim.value,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: "logo",
                  child: Container(
                    child: Image.asset('images/logo.png'),
                    height: 60.0,
                  ),
                ),
                AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText(
                      'Lighty Chat',
                      speed: Duration(milliseconds: 100),
                      textStyle: TextStyle(
                        fontSize: 45.0,
                        fontWeight: FontWeight.w900,
                      ),
                    )
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            RoundedButton(
                text: "Login",
                color: Colors.blueAccent,
                onPressed: () => Navigator.pushNamed(context, LoginScreen.id)),
            RoundedButton(
              color: Colors.blue,
              onPressed: () =>
                  Navigator.pushNamed(context, RegistrationScreen.id),
              text: "Register",
            ),
          ],
        ),
      ),
    );
  }
}
