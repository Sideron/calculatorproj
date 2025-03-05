import 'package:flutter/material.dart';

class RowButtons extends StatelessWidget {
  const RowButtons(this.buttons, {super.key, this.scale = 1});

  final List<Widget> buttons;
  final int scale;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: scale,
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch, children: buttons),
    );
  }
}
