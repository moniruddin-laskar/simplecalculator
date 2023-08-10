import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:simplecalculator/const/colors.dart';
import 'package:simplecalculator/screens/calculator_screen.dart';
import 'package:simplecalculator/utils/common_widgets.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    moveToNextScreen();
  }

  Future moveToNextScreen() async {
    await Future.delayed(const Duration(seconds: 3), () {
      gotoWithoutBack(context, const SimpleCalculatorScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: fullHeight(context),
            width: fullWidth(context),
            color: blue,
            child: Center(
              child: textBold(
                  color: white,
                  maxLine: 1,
                  size: 30,
                  text: "Simple Calculator"),
            ),
          ),
          Positioned(
            bottom: 50,
            child: SizedBox(
              width: fullWidth(context),
              child: Align(
                alignment: Alignment.center,
                child: SpinKitRing(
                  color: white,
                  size: 40.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
