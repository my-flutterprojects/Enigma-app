import 'package:enigma/components/my_textfield.dart';
import 'package:enigma/components/post_message.dart';
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
      backgroundColor: Colors.black,
      // appBar: AppBar(
      //   backgroundColor: Colors.black,
      // ),

      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Expanded(
                child: StreamBuilder(
                  stream: database.getPostsStream(),
                  builder: (context, snapshot) {
                    final posts = snapshot.data!.docs;
                    if (snapshot.data == null || posts.isEmpty) {
                      return const Center(
                        child: Padding(
                          padding: EdgeInsets.all(25),
                          child: Text(
                            "No Posts..Post Something!",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      );
                    }
                    return ListView.builder(
                      itemCount: posts.length,
                      itemBuilder: (context, index) {
                        final post = posts[index];
                        String message = post['PostMessage'];
                        String userEmail = post['UserEmail'];
                        // var timestamp = post['TimeStamp'];

                        return PostMessage(
                          message: message,
                          userEmail: userEmail,
                        );
                      },
                    );
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
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
                      icon: Icon(
                        Icons.arrow_circle_up_rounded,
                        color: Colors.amber,
                      ),
                      color: Colors.white,
                      hoverColor: Colors.green[700],
                    )
                  ],
                ),
              ),
              // Text(
              //   'Logged in as ' + currentUser.email!,
              //   style: TextStyle(color: Colors.white),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
