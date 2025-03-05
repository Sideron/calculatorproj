import 'package:calculatorproj/services/calc_state.dart';
import 'package:flutter/material.dart';

class ExpressionHistory extends StatelessWidget {
  const ExpressionHistory(this.calcState, {super.key});

  final CalcState calcState;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        reverse: true,
        child: Container(
          //decoration: BoxDecoration(color: Colors.amber),
          alignment: Alignment.bottomRight,
          child: Column(
            children:
                calcState.resultHistory.map((x) => restHistCalc(x)).toList(),
          ),
        ),
      ),
    );
  }

  Container restHistCalc(String txt) {
    return Container(
      alignment: Alignment.topRight,
      child: TextButton(
        onPressed: () => calcState.setExpression(txt),
        style: TextButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
            padding: EdgeInsets.only(top: 2, bottom: 2)),
        child: Container(
          alignment: Alignment.topRight,
          child: Text(
            txt,
            textAlign: TextAlign.right,
            style: TextStyle(
              color: Colors.grey,
              fontSize: 44,
            ),
          ),
        ),
      ),
    );
  }
}
