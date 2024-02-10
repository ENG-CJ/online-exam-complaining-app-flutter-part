import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:online_exam_conmplaining_app/const/colors.dart';
import 'package:online_exam_conmplaining_app/pages/active_complaints.dart';
import 'package:online_exam_conmplaining_app/providers/loginProvider.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  String? username;

  String? password;

  bool isHidden = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colors["primary"],
        title: Text(
          'Sign in',
          style: GoogleFonts.poppins(
              fontWeight: FontWeight.w500,
              fontSize: 20,
              color: Colors.white,
              letterSpacing: 3),
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Center(
                  child: Container(
                    width: 160,
                    height: 160,
                    child: Image.asset('./assets/logo.png'),
                  ),
                ),
                Gap(10),
                Center(
                  child: RichText(
                    text: TextSpan(
                      text: 'Welcome to Jamhuriya University,',
                      style: GoogleFonts.poppins(
                          fontSize: 15,
                          letterSpacing: 1.5,
                          color: Colors.black),
                      children: [
                        TextSpan(
                          text: '\n Please login to continue',
                          style: GoogleFonts.poppins(
                              fontSize: 15,
                              letterSpacing: 1.5,
                              color: Colors.black),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Gap(35),
                Container(
                  width: double.infinity,
                  child: Form(
                    key: _formkey,
                    child: Column(
                      children: [
                        TextFormField(
                          validator: (val) {
                            if (val != null) {
                              if (val.isEmpty) return "username is required";
                            }
                          },
                          onSaved: (newVal) => username = newVal,
                          style: GoogleFonts.poppins(
                              fontSize: 15, color: Colors.black),
                          decoration: InputDecoration(
                            errorStyle: GoogleFonts.poppins(
                                fontSize: 13,
                                letterSpacing: 2,
                                color: colors['error']),
                            prefixIcon: Icon(
                              Icons.person,
                              color: colors['primary'],
                            ),
                            hintText: "Username",
                            hintStyle: GoogleFonts.poppins(
                                fontSize: 14, color: Colors.grey.shade500),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(
                                  int.parse("0xff3652AD"),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Gap(15),
                        TextFormField(
                          validator: (val) {
                            if (val != null) {
                              if (val.isEmpty) return "password is required";
                            }
                          },
                          onSaved: (newVal) => password = newVal,
                          obscureText: isHidden,
                          style: GoogleFonts.poppins(
                              fontSize: 15, color: Colors.black),
                          decoration: InputDecoration(
                            errorStyle: GoogleFonts.poppins(
                                fontSize: 13,
                                letterSpacing: 2,
                                color: colors['error']),
                            prefixIcon: Icon(
                              Icons.lock_outline,
                              color: colors['primary'],
                            ),
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  isHidden = !isHidden;
                                });
                              },
                              icon: Icon(isHidden
                                  ? Icons.visibility_off
                                  : Icons.visibility),
                            ),
                            hintText: "Password",
                            hintStyle: GoogleFonts.poppins(
                                fontSize: 14, color: Colors.grey.shade500),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(
                                  int.parse("0xff3652AD"),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Gap(50),
                        GestureDetector(
                          onTap: () async {
                            _formkey.currentState!.save();
                            if (_formkey.currentState!.validate()) {
                              Provider.of<Loginprovider>(context, listen: false)
                                  .login(username!, password!)
                                  .then((value) {
                                if (value == null) {
                                  CoolAlert.show(
                                      context: context,
                                      type: CoolAlertType.error,
                                      title: "Auth Error",
                                      text:
                                          "Username Or Password is Incorrect");
                                  return;
                                }
                                Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>ActiveComplaints()));
                              });
                            }
                          },
                          child: Container(
                            width: double.infinity,
                            padding: EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 20,
                            ),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: colors['primary']),
                            child: Center(
                              child: Text(
                                "Login",
                                style: GoogleFonts.poppins(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                    letterSpacing: 2),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
