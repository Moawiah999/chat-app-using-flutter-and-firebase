import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../components/messageline.dart';
import '../components/messagestreambuilder.dart';

final _fierstore = FirebaseFirestore.instance;
late User signedInUser;

class ChateScreen extends StatefulWidget {
  static const String screenRoute = "ChateScreen";
  const ChateScreen({super.key});

  @override
  State<ChateScreen> createState() => _ChateScreenState();
}

class _ChateScreenState extends State<ChateScreen> {
  final messageTextController = TextEditingController();
  final _auth = FirebaseAuth.instance;

  String? masegtext;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrenUser();
  }

  void getCurrenUser() {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        signedInUser = user;
        print(signedInUser.email);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 183, 235, 60),
        title: Row(
          children: [
            SizedBox(
              width: 10,
            ),
            Lottie.asset("animations/arty_chat.json", height: 25),
            SizedBox(
              width: 15,
            ),
            Text("chat")
          ],
        ),
        actions: [
          IconButton(
            onPressed: () async {
              //add here logout funchon
              await _auth.signOut();
              Navigator.pop(context);
            },
            icon: Icon(Icons.close),
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.centerRight,
                end: Alignment.topCenter,
                colors: [
              Colors.blue.shade500,
              Colors.limeAccent,
              Colors.black54,
            ])),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              MessageStreamBuilder(),
              Container(
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(width: 2, color: Colors.orange),
                  ),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: TextField(
                        controller: messageTextController,
                        onChanged: (value) {
                          masegtext = value;
                        },
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            hintText: "Write your message here....",
                            border: InputBorder.none),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        messageTextController.clear();
                        _fierstore.collection("messages").add(
                          {
                            "text": masegtext,
                            "sender": signedInUser.email,
                            "time": FieldValue.serverTimestamp()
                          },
                        );
                      },
                      child: Text(
                        "send",
                        style: TextStyle(
                            color: Colors.blue[800],
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
