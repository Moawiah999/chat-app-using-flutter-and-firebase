import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../screens/chate_screen.dart';
import 'messageline.dart';

final _fierstore = FirebaseFirestore.instance;

class MessageStreamBuilder extends StatelessWidget {
  const MessageStreamBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      builder: (context, snapshot) {
        List<MessageLine> messageWidgets = [];
        if (!snapshot.hasData) {
          //add her a spener
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.red,
            ),
          );
        }
        final messages = snapshot.data!.docs.reversed;
        for (var message in messages) {
          final messageText = message.get("text");
          final messageSender = message.get("sender");
          final cureentUser = signedInUser.email;

          final messageWidget = MessageLine(
            sender: messageSender,
            text: messageText,
            isMe: cureentUser == messageSender,
          );
          messageWidgets.add(messageWidget);
        }
        return Expanded(
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            children: messageWidgets,
            reverse: true,
          ),
        );
      },
      stream: _fierstore.collection("messages").orderBy("time").snapshots(),
    );
  }
}
