import 'package:flutter/material.dart';

class CalcState extends ChangeNotifier {
  String expression = "0";
  List<String> resultHistory = [];

  void addCharacter(String char) {
    String lastChar = expression.substring(expression.length - 1);
    if (isNumeric(char) || (isNumeric(lastChar))) {
      expression =
          expression == '0' && isNumeric(char) ? char : '$expression$char';
    }
    notifyListeners();
  }

  void setExpression(String exp) {
    expression = exp;
    notifyListeners();
  }

  void cleanConsole() {
    expression = "0";
    notifyListeners();
  }

  void solveExpression() {
    String lastChar = expression.substring(expression.length - 1);
    if (!isNumeric(lastChar)) return;
    resultHistory.add(expression);
    String newExp = expression.replaceAll('x', '*');
    List<String> tokens = _tokenizar(newExp);
    print(tokens);
    double result = _evaluarTokens(tokens);
    expression = result.toString();
    if (expression.substring(expression.length - 2) == '.0') {
      expression = expression.substring(0, expression.length - 2);
    }
    notifyListeners();
  }

  bool isNumeric(String s) {
    return double.tryParse(s) != null;
  }

  List<String> _tokenizar(String expresion) {
    RegExp regex = RegExp(r'(\d+(\.\d+)?|[\+\-\*\/\%])');
    List<String> tokens =
        regex.allMatches(expresion).map((m) => m.group(0)!).toList();
    if (tokens[0] == '-') {
      tokens.removeAt(0);
      tokens[0] = '-' + tokens[0];
    }
    return tokens;
  }

  double _evaluarTokens(List<String> tokens) {
    List<double> valores = [];
    List<String> operadores = [];

    Map<String, int> precedencia = {'+': 1, '-': 1, '*': 2, '/': 2, '%': 3};

    void procesarOperacion() {
      if (valores.length < 2 || operadores.isEmpty) return;
      double b = valores.removeLast();
      double a = valores.removeLast();
      String operador = operadores.removeLast();
      switch (operador) {
        case '+':
          valores.add(a + b);
          break;
        case '-':
          valores.add(a - b);
          break;
        case '*':
          valores.add(a * b);
          break;
        case '/':
          valores.add(a / b);
          break;
        case '%':
          valores.add(a % b);
          break;
      }
    }

    for (String token in tokens) {
      if (double.tryParse(token) != null) {
        valores.add(double.parse(token));
      } else {
        while (operadores.isNotEmpty &&
            precedencia[operadores.last]! >= precedencia[token]!) {
          procesarOperacion();
        }
        operadores.add(token);
      }
    }

    while (operadores.isNotEmpty) {
      procesarOperacion();
    }

    return valores.isNotEmpty ? valores.first : 0.0;
  }
}
