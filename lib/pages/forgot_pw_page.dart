import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:validators/validators.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final _emailcontroller = TextEditingController();
  bool isEmailCorrect = false;

  @override
  void dispose() {
    _emailcontroller.dispose();
    super.dispose();
  }

  Future passwordReset() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: _emailcontroller.text.trim());
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text('Password reset link sent'),
          );
        },
      );
    } on FirebaseException catch (e) {
      print(e);
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text(
              e.message.toString(),
            ),
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Enter email to reset password',
            style: GoogleFonts.vinaSans(fontSize: 25, color: Colors.white),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 25,
            ),
            child: TextField(
              controller: _emailcontroller,
              onChanged: (val) {
                setState(() {
                  isEmailCorrect = isEmail(val);
                });
              },
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(15),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color:
                          isEmailCorrect == false ? Colors.red : Colors.green),
                  borderRadius: BorderRadius.circular(15),
                ),
                hintText: 'Email',
                fillColor: Colors.grey[200],
                filled: true,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          MaterialButton(
            onPressed: passwordReset,
            child: Text(
              'Reset Password',
              style: TextStyle(color: Colors.white),
            ),
            color: Colors.green[700],
          ),
        ],
      ),
    );
  }
}
