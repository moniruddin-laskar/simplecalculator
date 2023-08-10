import 'package:flutter/material.dart';
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
      backgroundColor: red,
      content: textBold(
        text: content,
        size: 16,
        color: white,
      ),
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
