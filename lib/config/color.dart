import 'package:flutter/material.dart';

abstract class CalcColors {
  abstract final Color mainBackgroundColor;

  abstract final Color mainIconTextColor;

  abstract final Color mainSubmitColor;
}

final class BrightColors extends CalcColors {
  @override
  Color get mainBackgroundColor => const Color.fromARGB(255, 255, 255, 255);

  @override
  Color get mainIconTextColor => DarkColors().mainBackgroundColor;

  @override
  Color get mainSubmitColor => const Color.fromARGB(255, 223, 16, 2);
}

final class DarkColors extends CalcColors {
  @override
  Color get mainBackgroundColor => const Color.fromARGB(255, 1, 0, 32);

  @override
  Color get mainIconTextColor => BrightColors().mainBackgroundColor;

  @override
  Color get mainSubmitColor => const Color.fromARGB(255, 180, 12, 0);
}
