import 'package:flutter/material.dart';

class MessageLine extends StatelessWidget {
  MessageLine({this.sender, this.text, required this.isMe});
  final String? sender;
  final String? text;
  final bool? isMe;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment:
            isMe! ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Text(
            "$sender",
            style: TextStyle(fontSize: 12, color: Colors.black),
          ),
          Material(
            elevation: 5,
            borderRadius: isMe!
                ? BorderRadius.only(
                    topLeft: Radius.circular(30),
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30))
                : BorderRadius.only(
                    topRight: Radius.circular(30),
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30)),
            color: isMe! ? Colors.blue.shade800 : Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text(
                "$text",
                style: TextStyle(
                    fontSize: 18, color: isMe! ? Colors.white : Colors.black45),
              ),
            ),
          ),
        ],
      ),
    );
    ;
  }
}
