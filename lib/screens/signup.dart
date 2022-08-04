import 'package:ecommerce_app/screens/login.dart';
import 'package:flutter/material.dart';

import '../widgets/changeScreen.dart';
import '../widgets/mybutton.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

String p =
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

RegExp regExp = new RegExp(p);
bool obserText = true;

class _SignUpState extends State<SignUp> {
  void validation() {
    if (_formKey.currentState!.validate()) {
      print("Yes");
    } else {
      print("No");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Container(
            child: Column(
              children: <Widget>[
                Container(
                  height: 220,
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        "Register",
                        style: TextStyle(
                            fontSize: 50, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  height: 350,
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextFormField(
                        validator: (value) {
                          int length = value != null ? value.length : 0;
                          if (length < 6) {
                            return "UserName is too short";
                          } else if (value == "" || value == null) {
                            return "Please Fill UserName";
                          }
                          return "";
                        },
                        decoration: InputDecoration(
                          hintText: "UserName",
                          hintStyle: TextStyle(color: Colors.black),
                          border: OutlineInputBorder(),
                        ),
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value == "" || value == null) {
                            return "Please Fill Email";
                          } else if (!regExp.hasMatch(value)) {
                            return "Email is Invalid";
                          }
                          return "";
                        },
                        decoration: InputDecoration(
                          hintText: "Email",
                          hintStyle: TextStyle(color: Colors.black),
                          border: OutlineInputBorder(),
                        ),
                      ),
                      TextFormField(
                        obscureText: obserText,
                        validator: (value) {
                          if (value == "" || value == null) {
                            return "Please Fill Password";
                          } else if (value.length < 8) {
                            return "Password is too short";
                          }
                          return "";
                        },
                        decoration: InputDecoration(
                          hintText: "Password",
                          suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                obserText = !obserText;
                              });
                              FocusScope.of(context).unfocus();
                            },
                            child: Icon(
                              obserText
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Colors.black,
                            ),
                          ),
                          hintStyle: TextStyle(color: Colors.black),
                          border: OutlineInputBorder(),
                        ),
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value == "" || value == null) {
                            return "Please Fill Phone Number";
                          } else if (value.length < 11) {
                            return "Phone Number Must Be 11";
                          }
                          return "";
                        },
                        decoration: InputDecoration(
                          hintText: "Phone Number",
                          hintStyle: TextStyle(color: Colors.black),
                          border: OutlineInputBorder(),
                        ),
                      ),
                      MyButton(
                          onPressed: () {
                            validation();
                          },
                          name: "Register"),
                      ChangeScreen(
                          name: "Login",
                          onTap: () {
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(builder: (ctx) => Login()));
                          },
                          whichAccount: "I Have Already An Account!")
                    ],
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
