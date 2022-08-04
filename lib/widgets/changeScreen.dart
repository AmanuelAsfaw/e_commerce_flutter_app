import 'package:flutter/material.dart';

class ChangeScreen extends StatelessWidget {
  final String whichAccount;
  final String name;
  final Function onTap;

  ChangeScreen(
      {required this.name, required this.onTap, required this.whichAccount});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(whichAccount),
        SizedBox(
          width: 10,
        ),
        GestureDetector(
          onTap: () {
            onTap();
          },
          child: Text(
            name,
            style: TextStyle(color: Colors.cyan, fontSize: 20),
          ),
        )
      ],
    );
  }
}
