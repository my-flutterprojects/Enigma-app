import 'package:flutter/material.dart';

class PostMessage extends StatelessWidget {
  final String message;
  final String userEmail;
  const PostMessage({
    super.key,
    required this.message,
    required this.userEmail,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      margin: EdgeInsets.only(top: 15, left: 15, right: 15),
      padding: EdgeInsets.all(10),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(userEmail),
              Text(
                message,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
