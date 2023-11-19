import 'package:enigma/pages/forgot_pw_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:validators/validators.dart';

class LoginPage extends StatefulWidget {
  final VoidCallback showRegisterPage;
  const LoginPage({super.key, required this.showRegisterPage});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //text controllers
  final _emailcontroller = TextEditingController();
  final _passwordcontroller = TextEditingController();
  var _obscurepw;
  bool isEmailCorrect = false;

  Future signIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: _emailcontroller.text.trim(),
      password: _passwordcontroller.text.trim(),
    );
  }

  @override
  void initState() {
    super.initState();
    _obscurepw = true;
  }

  @override
  void dispose() {
    _emailcontroller.dispose();
    _passwordcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // SizedBox(height: 30),

                Text(
                  "Welcome To",
                  style:
                      GoogleFonts.vinaSans(fontSize: 55, color: Colors.white),
                ),
                Image.asset(
                  'images/one.png',
                  height: 140,
                ),
                // Text(
                //   'Enigma',
                //   style: GoogleFonts.vinaSans(fontSize: 50, color: Colors.white),
                // ),
                Text(
                  'The official web and coding club',
                  style:
                      GoogleFonts.vinaSans(fontSize: 25, color: Colors.white),
                ),
                Text(
                  'VSSUT,Burla',
                  style:
                      GoogleFonts.vinaSans(fontSize: 25, color: Colors.white),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 25,
                  ),
                  child: TextField(
                    keyboardType: TextInputType.emailAddress,
                    autofillHints: [AutofillHints.email],
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
                            color: isEmailCorrect == false
                                ? Colors.red
                                : Colors.green),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      hintText: 'Email',
                      fillColor: Colors.grey[200],
                      filled: true,
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 25,
                  ),
                  child: TextField(
                    obscureText: _obscurepw,
                    controller: _passwordcontroller,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _obscurepw = !_obscurepw;
                            });
                          },
                          icon: _obscurepw
                              ? Icon(Icons.visibility)
                              : Icon(Icons.visibility_off)),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      hintText: 'Password',
                      fillColor: Colors.grey[200],
                      filled: true,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return ForgotPasswordPage();
                              },
                            ),
                          );
                        },
                        child: Text(
                          'Forgot PassWord?',
                          style: GoogleFonts.vinaSans(
                              fontSize: 20, color: Colors.blue),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: GestureDetector(
                    onTap: signIn,
                    child: Container(
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          color: Colors.green[700],
                          borderRadius: BorderRadius.circular(25)),
                      child: Center(
                        child: Text(
                          'Sign In',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Not a member?',
                      style: GoogleFonts.vinaSans(
                          fontSize: 22, color: Colors.white),
                    ),
                    GestureDetector(
                      onTap: widget.showRegisterPage,
                      child: Text(' Register Now',
                          style: GoogleFonts.vinaSans(
                              fontSize: 22, color: Colors.blue)),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
