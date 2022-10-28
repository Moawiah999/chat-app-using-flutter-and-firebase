import 'package:chatapp/screens/chate_screen.dart';
import 'package:chatapp/screens/registration_screen.dart';
import 'package:chatapp/screens/signin_screen.dart';
import 'package:chatapp/screens/welcomescreen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'firebase_options.dart';

final _auth = FirebaseAuth.instance;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MaterialApp(
    initialRoute: _auth.currentUser != null
        ? ChateScreen.screenRoute
        : Welcome_Screen.screenRoute,
    routes: {
      Welcome_Screen.screenRoute: (context) => Welcome_Screen(),
      SiginScreen.screenRoute: (context) => SiginScreen(),
      Registrationscreen.screenRoute: (context) => Registrationscreen(),
      ChateScreen.screenRoute: (context) => ChateScreen(),
    },
    debugShowCheckedModeBanner: false,
    // home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Welcome_Screen();
  }
}
