import 'package:chatapp/screens/chate_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../widget/my_button.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SiginScreen extends StatefulWidget {
  static const String screenRoute = "SiginScreen";
  const SiginScreen({super.key});

  @override
  State<SiginScreen> createState() => _SiginScreenState();
}

class _SiginScreenState extends State<SiginScreen> {
  final _auth = FirebaseAuth.instance;
  late String email;
  late String password;
  bool showspener = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: showspener,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                width: double.infinity,
                height: 180,
                child: Lottie.asset("animations/arty_chat.json"),
              ),
              TextField(
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  email = value;
                },
                decoration: InputDecoration(
                  hintText: "Enter your email",
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.orange,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blue,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                obscureText: true,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  password = value;
                },
                decoration: InputDecoration(
                  hintText: "Enter the password",
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.orange,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blue,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Mybutton(
                title: "Sigin",
                color: Colors.yellow.shade900,
                onPressed: () async {
                  setState(() {
                    showspener = true;
                  });
                  try {
                    final user = await _auth.signInWithEmailAndPassword(
                        email: email, password: password);
                    if (user != null) {
                      Navigator.pushNamed(context, ChateScreen.screenRoute);
                      setState(() {
                        showspener = false;
                      });
                    }
                  } catch (e) {
                    // if (email != email && password != password) {
                    //   showDialog(
                    //     context: context,
                    //     builder: (context) {
                    //       return AlertDialog(
                    //         backgroundColor: Colors.red,
                    //         title: Text('Invalid'),
                    //         content: Text(
                    //           'You have a wrong email and password',
                    //           style: TextStyle(
                    //               fontSize: 22, fontWeight: FontWeight.w600),
                    //         ),
                    //       );
                    //     },
                    //   );
                    // }
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
