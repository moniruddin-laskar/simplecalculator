import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simplecalculator/appstate/calculator_provider.dart';
import 'package:simplecalculator/const/colors.dart';

double fullWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

double fullHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

///Vertical Space
Widget vSpace(
  double h,
) {
  return SizedBox(
    height: h,
  );
}

///Horizontal Space
Widget hSpace(
  double w,
) {
  return SizedBox(
    width: w,
  );
}

///SnackBar
showSnackbar(
  BuildContext context,
  String content,
) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: grey,
      content: textBold(
        text: content,
        size: 16,
        color: white,
      ),
    ),
  );
}

///Navigate Push
goto(BuildContext context, Widget nextScreen) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => nextScreen,
    ),
  );
}

///Navigate Without Back
gotoWithoutBack(
  BuildContext context,
  Widget nextScreen,
) {
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(
      builder: (context) => nextScreen,
    ),
  );
}

///text-Bold Style
Widget textBold({
  String text = "",
  double size = 10,
  Color? color,
  int? maxLine,
}) {
  return Text(
    text,
    overflow: TextOverflow.ellipsis,
    maxLines: maxLine,
    style: TextStyle(
      color: color,
      fontSize: size,
      fontWeight: FontWeight.bold,
      fontStyle: FontStyle.normal,
    ),
  );
}

AppBar appbar(
  BuildContext context,
  String title,
) {
  return AppBar(
    title: textBold(color: white, maxLine: 1, size: 20, text: title),
  );
}

class CalculatorButton extends StatelessWidget {
  final String label;
  final bool isColored, isEqualSign, canBeFirst;
  const CalculatorButton(
    this.label, {
    this.isColored = false,
    this.isEqualSign = false,
    this.canBeFirst = true,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final calculatorProvider =
        Provider.of<CalculatorProvider>(context, listen: false);
    return Material(
      color: blue,
      child: InkWell(
        borderRadius: BorderRadius.circular(20.0),
        onTap: () {
          calculatorProvider.addToEquation(
            label,
            canBeFirst,
            context,
          );
        },
        child: Center(
          child: isEqualSign
              ? Container(
                  height: fullHeight(context) * 0.1,
                  width: fullWidth(context) * 0.2,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    color: yellow,
                  ),
                  child: Center(
                      child: textBold(
                          color: black, size: 30, maxLine: 1, text: label)
                      ),
                )
              : textBold(
                  color: isColored ? black : white,
                  size: 30,
                  maxLine: 1,
                  text: label),
        ),
      ),
    );
  }
}

List<CalculatorButton> buttons = <CalculatorButton>[
  const CalculatorButton('AC', canBeFirst: false),
  const CalculatorButton('⌫', canBeFirst: false),
  const CalculatorButton('.', canBeFirst: false),
  const CalculatorButton(' ÷ ', isColored: true, canBeFirst: false),
  const CalculatorButton('7'),
  const CalculatorButton('8'),
  const CalculatorButton('9'),
  const CalculatorButton(' × ', isColored: true, canBeFirst: false),
  const CalculatorButton('4'),
  const CalculatorButton('5'),
  const CalculatorButton('6'),
  const CalculatorButton(' - ', isColored: true, canBeFirst: false),
  const CalculatorButton('1'),
  const CalculatorButton('2'),
  const CalculatorButton('3'),
  const CalculatorButton(' + ', isColored: true, canBeFirst: false),
  const CalculatorButton('00'),
  const CalculatorButton('0'),
  const CalculatorButton('000'),
  const CalculatorButton('=', isEqualSign: true, canBeFirst: false),
];
