import 'package:flutter/material.dart';

class PasswordTextFormField extends StatelessWidget {
  final bool obserText;
  final Function validator;
  final Function onChanged;
  final Function onTap;
  final String name;

  PasswordTextFormField(
      {required this.onChanged,
      required this.onTap,
      required this.name,
      required this.obserText,
      required this.validator});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obserText,
      validator: (value) {
        return validator(value);
      },
      onChanged: (value) {
        onChanged(value);
      },
      decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: name,
          suffixIcon: GestureDetector(
              onTap: () {
                onTap();
              },
              child: Icon(
                obserText ? Icons.visibility : Icons.visibility_off,
                color: Colors.black,
              )),
          hintStyle: TextStyle(color: Colors.black)),
    );
  }
}
