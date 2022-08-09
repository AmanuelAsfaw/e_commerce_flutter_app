import 'package:flutter/material.dart';

class MyTextFormField extends StatelessWidget {
  final Function validator;
  final Function onChanged;
  final String name;

  MyTextFormField(
      {required this.onChanged, required this.name, required this.validator});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        return validator(value);
      },
      onChanged: (value) {
        onChanged(value);
      },
      decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: name,
          hintStyle: TextStyle(color: Colors.black)),
    );
  }
}
