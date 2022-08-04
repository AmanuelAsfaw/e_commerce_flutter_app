import 'package:ecommerce_app/screens/signup.dart';
import 'package:ecommerce_app/widgets/changeScreen.dart';
import 'package:ecommerce_app/widgets/mybutton.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
String p =
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

RegExp regExp = new RegExp(p);
bool obserText = true;

class _LoginState extends State<Login> {
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
      body: Form(
        key: _formKey,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 300,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "Login",
                      style:
                          TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value == "" || value == null) {
                          return "Please Fill Email";
                        } else if (!regExp.hasMatch(value)) {
                          return "Email Is Invalid";
                        }
                        return "";
                      },
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Email",
                          hintStyle: TextStyle(color: Colors.black)),
                    ),
                    TextFormField(
                      obscureText: obserText,
                      validator: (value) {
                        if (value == "" || value == null) {
                          return "Please Fill Password";
                        } else if (value.length < 8) {
                          return "Password Is too short";
                        }
                        return "";
                      },
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Password",
                          suffixIcon: GestureDetector(
                              onTap: () {
                                FocusScope.of(context).unfocus();
                                setState(() {
                                  obserText = !obserText;
                                });
                              },
                              child: Icon(
                                obserText
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Colors.black,
                              )),
                          hintStyle: TextStyle(color: Colors.black)),
                    ),
                    MyButton(
                        onPressed: () {
                          validation();
                        },
                        name: "Login"),
                    ChangeScreen(
                        name: "SignUp",
                        onTap: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(builder: (ctx) => SignUp()));
                        },
                        whichAccount: "I Have No Account!")
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
