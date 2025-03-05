import 'package:calculatorproj/components/elements/expression_history.dart';
import 'package:calculatorproj/services/calc_state.dart';
import 'package:flutter/material.dart';

class CalcConsole extends StatelessWidget {
  const CalcConsole(this.calcState, {super.key});

  final CalcState calcState;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomRight,
      width: MediaQuery.of(context).size.width,
      //decoration: BoxDecoration(color: Colors.amber),
      padding: const EdgeInsets.all(16),
      color: Colors.black,
      child: Column(verticalDirection: VerticalDirection.up, children: [
        expressionDisplay(),
        ExpressionHistory(calcState),
      ]),
    );
  }

  SingleChildScrollView expressionDisplay() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      reverse: true,
      padding: EdgeInsets.all(0),
      child: Container(
        alignment: Alignment.topRight,
        //color: Colors.amber,
        child: Text(
          calcState.expression,
          style: TextStyle(
            color: Colors.white,
            fontSize: 50,
          ),
          textAlign: TextAlign.right,
        ),
      ),
    );
  }
}
