import 'package:calculatorproj/components/calc_console.dart';
import 'package:calculatorproj/components/calc_keyboard.dart';
import 'package:calculatorproj/services/calc_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppController extends StatefulWidget {
  const AppController({super.key});

  @override
  State<AppController> createState() => _AppControllerState();
}

class _AppControllerState extends State<AppController> {
  late CalcState calcState = new CalcState();

  @override
  void initState() {
    super.initState();
    calcState = CalcState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
        value: calcState,
        child: Consumer<CalcState>(builder: (context, calcState, child) {
          return calcStructure();
        }));
  }

  Column calcStructure() {
    return Column(
      children: [
        Expanded(flex: 3, child: CalcConsole(calcState)),
        Expanded(flex: 5, child: CalcKeyboard(calcState)),
      ],
    );
  }
}
