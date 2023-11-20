import 'package:enigma/components/button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:validators/validators.dart';

class RegisterPage extends StatefulWidget {
  final VoidCallback showLoginPage;
  const RegisterPage({super.key, required this.showLoginPage});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  //text controllers
  final _emailcontroller = TextEditingController();
  final _passwordcontroller = TextEditingController();
  final _confirmpasswordcontroller = TextEditingController();
  bool _obscurepw = true;
  bool _obscurecpw = true;
  bool isEmailCorrect = false;
  bool isPasswordValid = true;

  Future signUp() async {
    showDialog(
      context: context,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );
    void displayMessage(String message) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(message),
        ),
      );
    }

    if (_passwordcontroller.text != _confirmpasswordcontroller.text) {
      Navigator.pop(context);
      displayMessage("Passwords don't match!");
      return;
    }

    if (passwordConfirmed()) {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailcontroller.text.trim(),
        password: _passwordcontroller.text.trim(),
      );
      if (context.mounted) Navigator.pop(context);
    }
  }

  bool passwordConfirmed() {
    if (_passwordcontroller.text.trim() ==
        _confirmpasswordcontroller.text.trim()) {
      return true;
    }
    return false;
  }

  bool _validatePassword(String password) {
    String pattern = r'^(?=.*[a-z])(?=.*[A-Z])(?=.*[\W_])';
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(password);
  }

  @override
  void initState() {
    super.initState();
    _obscurepw = true;
    _obscurecpw = true;
  }

  @override
  void dispose() {
    _emailcontroller.dispose();
    _passwordcontroller.dispose();
    _confirmpasswordcontroller.dispose();
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
                  "Register To",
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
                    onChanged: (val) {
                      setState(() {
                        isPasswordValid = _validatePassword(val);
                      });
                    },
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _obscurepw = !_obscurepw;
                          });
                        },
                        icon: _obscurepw
                            ? Icon(Icons.visibility_off)
                            : Icon(Icons.visibility),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: isPasswordValid ? Colors.green : Colors.red,
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      hintText: 'Password',
                      fillColor: Colors.grey[200],
                      filled: true,
                      errorText: isPasswordValid
                          ? null
                          : 'Must contain uppercase, lowercase, special characters',
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
                    obscureText: _obscurecpw,
                    controller: _confirmpasswordcontroller,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _obscurecpw = !_obscurecpw;
                            });
                          },
                          icon: _obscurecpw
                              ? Icon(Icons.visibility_off)
                              : Icon(Icons.visibility)),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      hintText: 'Confirm Password',
                      fillColor: Colors.grey[200],
                      filled: true,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: GestureDetector(
                    onTap: signUp,
                    child: MyButton(text: 'Sign UP'),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already a member?',
                      style: GoogleFonts.vinaSans(
                          fontSize: 22, color: Colors.white),
                    ),
                    GestureDetector(
                      onTap: widget.showLoginPage,
                      child: Text(' Sign In',
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
