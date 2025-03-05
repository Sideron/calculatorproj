import 'package:calculatorproj/components/elements/calc_button.dart';
import 'package:calculatorproj/components/row_buttons.dart';
import 'package:calculatorproj/services/calc_state.dart';
import 'package:flutter/material.dart';

class CalcKeyboard extends StatelessWidget {
  const CalcKeyboard(this.calcState, {super.key});

  final CalcState calcState;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: Column(
            children: [
              RowButtons([
                CalcButton('%', () => calcState.addCharacter('%')),
                CalcButton('C', () => calcState.cleanConsole()),
                CalcButton('/', () => calcState.addCharacter('/')),
              ]),
              RowButtons([
                CalcButton('7', () => calcState.addCharacter('7')),
                CalcButton('8', () => calcState.addCharacter('8')),
                CalcButton('9', () => calcState.addCharacter('9'))
              ]),
              RowButtons([
                CalcButton('4', () => calcState.addCharacter('4')),
                CalcButton('5', () => calcState.addCharacter('5')),
                CalcButton('6', () => calcState.addCharacter('6'))
              ]),
              RowButtons([
                CalcButton('1', () => calcState.addCharacter('1')),
                CalcButton('2', () => calcState.addCharacter('2')),
                CalcButton('3', () => calcState.addCharacter('3'))
              ]),
              RowButtons([
                CalcButton(
                  '0',
                  () => calcState.addCharacter('0'),
                  scale: 2,
                ),
                CalcButton('.', () => calcState.addCharacter('.'))
              ]),
            ],
          ),
        ),
        Expanded(
            flex: 1,
            child: Column(
              children: [
                RowButtons(
                    [CalcButton('x', () => calcState.addCharacter('x'))]),
                RowButtons(
                    [CalcButton('+', () => calcState.addCharacter('+'))]),
                RowButtons(
                    [CalcButton('-', () => calcState.addCharacter('-'))]),
                RowButtons(
                  [CalcButton('=', () => calcState.solveExpression())],
                  scale: 2,
                ),
              ],
            )),
      ],
    );
  }
}
