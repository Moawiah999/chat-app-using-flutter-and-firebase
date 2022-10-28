import 'package:chatapp/screens/registration_screen.dart';
import 'package:chatapp/screens/signin_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../widget/my_button.dart';

class Welcome_Screen extends StatefulWidget {
  static const String screenRoute = "Welcome_Screen";
  const Welcome_Screen({super.key});

  @override
  State<Welcome_Screen> createState() => _Welcome_ScreenState();
}

class _Welcome_ScreenState extends State<Welcome_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyanAccent,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            width: double.infinity,
            height: 180,
            child: Lottie.asset("animations/arty_chat.json"),
          ),
          Container(
            alignment: Alignment.center,
            width: double.infinity,
            height: 42,
            child: Text(
              "Chat with love",
              style: TextStyle(fontSize: 40, color: Color(0xff2e386b)),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Mybutton(
            color: Colors.yellow[900]!,
            title: "sign in",
            onPressed: () {
              Navigator.pushNamed(context, SiginScreen.screenRoute);
            },
          ),
          Mybutton(
            color: Colors.blue[800]!,
            title: "Registration",
            onPressed: () {
              Navigator.pushNamed(context, Registrationscreen.screenRoute);
            },
          ),
        ],
      ),
    );
  }
}
