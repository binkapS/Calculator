import 'package:calculator/config/key.dart';
import 'package:function_tree/function_tree.dart';

final class CustomMath {
  static String evalaute({required String expression}) {
    final res = replaceOperators(expression: expression).interpret();
    if (res.toString().contains('.') &&
        int.parse(res
                .toString()
                .substring((res.toString().lastIndexOf('.') + 1))) >
            0) {
      return res.toDouble().toString();
    }
    return res.toInt().toString();
  }

  static String replaceOperators({required String expression}) {
    return expression
        .trim()
        .replaceAll(LogicKey.division, LogicKey.divisionOperator)
        .replaceAll(LogicKey.multiplication, LogicKey.multiplicationOperator);
    // .replaceAll(LogicKey.percentage, '¬/');
  }
}
