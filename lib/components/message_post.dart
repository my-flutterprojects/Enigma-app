import 'package:flutter/material.dart';

class MessagePost extends StatelessWidget {
  final String message;
  final String user;

  const MessagePost({
    super.key,
    required this.message,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(children: [
          Text(user),
          Text(message),
        ]),
      ],
    );
  }
}
