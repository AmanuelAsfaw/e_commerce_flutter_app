import 'package:ecommerce_app/screens/login.dart';
import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';

import '../widgets/changeScreen.dart';
import '../widgets/myTextFormField.dart';
import '../widgets/mybutton.dart';
import '../widgets/passwordTextFormField.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

String p =
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

RegExp regExp = new RegExp(p);
bool obserText = true;
String email = "";
String password = "";
String phone = "";
String username = "";

class _SignUpState extends State<SignUp> {
  void validation() async {
    if (_formKey.currentState!.validate()) {
      print(email);
      print(password);
      try {
        UserCredential result = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);
        print(result.user?.uid);
      } on PlatformException catch (e) {
        print("PlatformException");
        print(e.message.toString());
        _scaffoldKey.currentState?.showSnackBar(
          SnackBar(content: Text(e.message.toString())),
        );
      } on FirebaseAuthException catch (e) {
        _scaffoldKey.currentState?.showSnackBar(
          SnackBar(content: Text(e.message.toString())),
        );
      }
    } else {
      print("No");
    }
  }

  Widget _buildAllTextFormField() {
    return Container(
      height: 300,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          MyTextFormField(
              name: "UserName",
              onChanged: (value) {
                setState(() {
                  username = value;
                });
              },
              validator: (value) {
                int length = value != null ? value.length : 0;
                if (length < 6) {
                  return "UserName is too short";
                } else if (value == "" || value == null) {
                  return "Please Fill UserName";
                }
              }),
          MyTextFormField(
              name: "Email",
              onChanged: (value) {
                setState(() {
                  email = value;
                });
              },
              validator: (value) {
                if (value == "" || value == null) {
                  return "Please Fill Email";
                } else if (!regExp.hasMatch(value)) {
                  return "Email is Invalid";
                }
              }),
          PasswordTextFormField(
              onTap: () {
                FocusScope.of(context).unfocus();
                setState(() {
                  obserText = !obserText;
                });
              },
              onChanged: (value) {
                setState(() {
                  password = value;
                });
              },
              name: "Password",
              obserText: obserText,
              validator: (value) {
                if (value == "" || value == null) {
                  return "Please Fill Password";
                } else if (value.length < 8) {
                  return "Password is too short";
                }
              }),
          MyTextFormField(
              name: "Phone Number",
              onChanged: (value) {
                setState(() {
                  phone = value;
                });
              },
              validator: (value) {
                if (value == "" || value == null) {
                  return "Please Fill Phone Number";
                } else if (value.length < 11) {
                  return "Phone Number Must Be 11";
                }
              })
        ],
      ),
    );
  }

  Widget _buildBottomPart() {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 10,
      ),
      height: 382,
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildAllTextFormField(),
          MyButton(
              onPressed: () {
                validation();
              },
              name: "Register"),
          SizedBox(
            height: 10,
          ),
          ChangeScreen(
              name: "Login",
              onTap: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (ctx) => Login()));
              },
              whichAccount: "I Have Already An Account!")
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
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
                    mainAxisSize: MainAxisSize.min,
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
                _buildBottomPart()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
