import 'package:calculator/config/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  bool darkTheme = false;
  late CalcColors _colors = BrightColors();

  final TextEditingController _controller =
      TextEditingController(text: '20+20');

  void updateThemeColors() {
    _colors = darkTheme ? BrightColors() : DarkColors();
    darkTheme = !darkTheme;
    refresh();
  }

  void refresh() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(
            60,
          ),
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 15,
            ),
            decoration: BoxDecoration(
              color: _colors.mainBackgroundColor,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  child: Image.asset(
                    darkTheme ? 'assets/logo_.png' : 'assets/logo.png',
                    width: 25,
                    height: 25,
                  ),
                ),
                GestureDetector(
                  onTap: updateThemeColors,
                  child: Icon(
                    darkTheme
                        ? CupertinoIcons.sun_max_fill
                        : CupertinoIcons.moon_stars_fill,
                    color: _colors.mainIconTextColor,
                  ),
                ),
              ],
            ),
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
            color: _colors.mainBackgroundColor,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 20,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    TextField(
                      controller: _controller,
                      keyboardType: TextInputType.none,
                      style: TextStyle(
                        color: _colors.mainIconTextColor,
                        fontSize: 25,
                        fontWeight: FontWeight.w400,
                      ),
                      textAlign: TextAlign.right,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                      ),
                    ),
                    Text(
                      '40',
                      style: TextStyle(
                        color: _colors.mainIconTextColor,
                        fontSize: 35,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.right,
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 20,
                ),
                decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.1),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(
                        20,
                      ),
                      topRight: Radius.circular(
                        20,
                      ),
                    )),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        calLogicButton(content: 'C'),
                        Expanded(
                          child: GestureDetector(
                            child: Container(
                              margin: const EdgeInsets.symmetric(
                                horizontal: 5,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.12),
                                borderRadius: const BorderRadius.only(
                                  topRight: Radius.circular(10),
                                  bottomLeft: Radius.circular(10),
                                ),
                              ),
                              padding: const EdgeInsets.symmetric(
                                vertical: 13,
                              ),
                              child: Icon(
                                Icons.backspace_rounded,
                                color: _colors.mainSubmitColor,
                                size: 22,
                              ),
                            ),
                          ),
                        ),
                        calLogicButton(content: '%'),
                        calLogicButton(content: '×'),
                      ],
                    ),
                    const SizedBox(
                      height: 13,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        calInputButton(content: '7'),
                        calInputButton(content: '8'),
                        calInputButton(content: '9'),
                        calLogicButton(content: '÷'),
                      ],
                    ),
                    const SizedBox(
                      height: 13,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        calInputButton(content: '4'),
                        calInputButton(content: '5'),
                        calInputButton(content: '6'),
                        calLogicButton(content: '-'),
                      ],
                    ),
                    const SizedBox(
                      height: 13,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        calInputButton(content: '1'),
                        calInputButton(content: '2'),
                        calInputButton(content: '3'),
                        calLogicButton(content: '+'),
                      ],
                    ),
                    const SizedBox(
                      height: 13,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        calInputButton(content: '.'),
                        calInputButton(content: '0'),
                        Expanded(
                          child: GestureDetector(
                            child: Container(
                              margin: const EdgeInsets.symmetric(
                                horizontal: 5,
                              ),
                              decoration: BoxDecoration(
                                color: _colors.mainSubmitColor,
                                borderRadius: const BorderRadius.only(
                                  topRight: Radius.circular(10),
                                  bottomLeft: Radius.circular(10),
                                ),
                              ),
                              padding: const EdgeInsets.symmetric(
                                vertical: 13,
                              ),
                              child: const Text(
                                '=',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget calLogicButton({required String content}) {
    return calCButton(
      content: content,
      color: _colors.mainSubmitColor,
    );
  }

  Widget calInputButton({required String content}) {
    return calCButton(
      content: content,
      color: _colors.mainIconTextColor,
    );
  }

  Widget calCButton({required String content, required Color color}) {
    return Expanded(
      child: GestureDetector(
        child: Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 5,
          ),
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.12),
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(10),
              bottomLeft: Radius.circular(10),
            ),
          ),
          padding: const EdgeInsets.symmetric(
            vertical: 13,
          ),
          child: Text(
            content,
            style: TextStyle(
              color: color,
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
