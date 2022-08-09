import 'package:ecommerce_app/screens/signup.dart';
import 'package:ecommerce_app/widgets/changeScreen.dart';
import 'package:ecommerce_app/widgets/myTextFormField.dart';
import 'package:ecommerce_app/widgets/mybutton.dart';
import 'package:ecommerce_app/widgets/passwordTextFormField.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

String p =
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

RegExp regExp = new RegExp(p);
bool obserText = true;
String email = "";
String password = "";

class _LoginState extends State<Login> {
  void validation() async {
    if (_formKey.currentState!.validate()) {
      try {
        UserCredential result = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: password);
        print(result.user?.uid);
        if (result.user?.email != null && result.user != null) {
          String? useremail = result.user?.email;
          String email_ = useremail == null ? "" : useremail;

          _scaffoldKey.currentState?.showSnackBar(
            SnackBar(content: Text("user-email " + email_)),
          );
        }
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
      UserCredential result = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
    } else {
      print("No");
    }
  }

  Widget _buildAllPart() {
    return Container(
      height: 300,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            "Login",
            style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
          ),
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
                  return "Email Is Invalid";
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
                  return "Password Is too short";
                }
              }),
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
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Form(
        key: _formKey,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [_buildAllPart()],
          ),
        ),
      ),
    );
  }
}
