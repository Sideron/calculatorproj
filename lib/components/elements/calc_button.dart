import 'package:flutter/material.dart';

class CalcButton extends StatelessWidget {
  const CalcButton(this.txtButton, this.pressedFunc,
      {this.scale = 1, super.key});

  final String txtButton;
  final int scale;
  final VoidCallback pressedFunc;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: scale,
      child: TextButton(
          onPressed: pressedFunc,
          style: TextButton.styleFrom(
              foregroundColor: Colors.white,
              //backgroundColor: Colors.blueGrey,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0))),
          child: Text(
            txtButton,
            style: TextStyle(fontSize: 40),
          )),
    );
  }
}
