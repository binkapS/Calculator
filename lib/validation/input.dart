import 'package:calculator/config/key.dart';

final class Validation {
  static bool logicKey({required String value, required String key}) {
    if (value.isEmpty && operatorShouldNotBeAtStart(key: key)) {
      return false;
    }
    if (value.isNotEmpty && lastIsOperator(value: value)) {
      return false;
    }
    return true;
  }

  static bool inputKey({required String value, required String key}) {
    if (key == '.' && value.isNotEmpty) {
      return !value.substring(lastOperatorIndex(value: value)).contains('.');
    }
    return true;
  }

  static bool operatorShouldNotBeAtStart({required String key}) {
    return (key == LogicKey.division) ||
        (key == LogicKey.multiplication) ||
        (key == LogicKey.percentage);
  }

  static int lastOperatorIndex({required String value}) {
    if (value.lastIndexOf(operatorRegExp()) != -1) {
      return value.lastIndexOf(operatorRegExp());
    }
    return 0;
  }

  static bool lastIsOperator({required String value}) {
    final String last = value[value.length - 1];
    return (last == LogicKey.addition) ||
        (last == LogicKey.substraction) ||
        (last == LogicKey.division) ||
        (last == LogicKey.multiplication) ||
        (last == LogicKey.percentage);
  }

  static RegExp operatorRegExp() {
    return RegExp(
        // ignore: unnecessary_string_escapes
        '[\/${LogicKey.percentage}\/${LogicKey.addition}\/${LogicKey.division}\/${LogicKey.multiplication}\/${LogicKey.substraction}]');
  }
}
