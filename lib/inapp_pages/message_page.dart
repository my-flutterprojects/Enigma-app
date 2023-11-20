import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:enigma/components/message_post.dart';
import 'package:enigma/components/my_textfield.dart';
import 'package:enigma/database/firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MesssagePage extends StatefulWidget {
  const MesssagePage({super.key});

  @override
  State<MesssagePage> createState() => _MesssagePageState();
}

class _MesssagePageState extends State<MesssagePage> {
  final currentUser = FirebaseAuth.instance.currentUser!;
  final textController = TextEditingController();
  final FirestoreDatabase database = FirestoreDatabase();

  void postMessage() {
    if (textController.text.isNotEmpty) {
      String message = textController.text;
      database.addPost(message);
    }
    textController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(15),
              child: Row(
                children: [
                  Expanded(
                    child: MyTextField(
                      hintText: 'Write something',
                      controller: textController,
                      obscureText: false,
                    ),
                  ),
                  IconButton(
                    onPressed: postMessage,
                    icon: Icon(Icons.arrow_circle_up),
                    color: Colors.black,
                    hoverColor: Colors.green[700],
                  )
                ],
              ),
            ),
            Text(
              'Logged in as ' + currentUser.email!,
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
