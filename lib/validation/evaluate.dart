import 'package:calculator/config/key.dart';
import 'package:function_tree/function_tree.dart';

final class CustomMath {
  static String evaluate({required String expression}) {
    if (expression.isEmpty) {
      return '0';
    }
    if (expression.contains(LogicKey.percentage)) {
      return evalReturnvalue(
          expression: evalPercentage(
              expression: replaceOperators(expression: expression)));
    }
    return evalReturnvalue(
        expression: replaceOperators(expression: expression).interpret());
  }

  static String replaceOperators({required String expression}) {
    return expression
        .trim()
        .replaceAll(LogicKey.division, LogicKey.divisionOperator)
        .replaceAll(LogicKey.multiplication, LogicKey.multiplicationOperator);
  }

  static String evalReturnvalue({required num expression}) {
    if (expression.toString().contains('.') &&
        int.parse(expression
                .toString()
                .substring((expression.toString().lastIndexOf('.') + 1))) >
            0) {
      return expression.toDouble().toString();
    }
    return expression.toInt().toString();
  }

  static num evalPercentage({required String expression}) {
    return (expression
                .substring(0, expression.lastIndexOf(LogicKey.percentage))
                .interpret() /
            100) *
        expression
            .substring((expression.lastIndexOf(
                    LogicKey.percentage, expression.length)) +
                1)
            .interpret();
  }
}
