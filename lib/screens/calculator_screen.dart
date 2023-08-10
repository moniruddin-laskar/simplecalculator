import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simplecalculator/appstate/calculator_provider.dart';
import 'package:simplecalculator/const/colors.dart';
import 'package:simplecalculator/utils/common_widgets.dart';

class SimpleCalculatorScreen extends StatelessWidget {
  const SimpleCalculatorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(
        context,
        'Simple Calculator'
      ),
      body: Column(
        children: [
          Container(
            width: fullWidth(context),
            height: fullHeight(context) * .3,
            padding: EdgeInsets.symmetric(
              vertical: fullWidth(context) * 0.08,
              horizontal: fullWidth(context) * 0.06,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(
                  height: fullHeight(context) * 0.04,
                  child: ListView(
                    reverse: true,
                    scrollDirection: Axis.horizontal,
                    children: [
                      Consumer<CalculatorProvider>(
                        builder: (context, equation, child) => textBold(
                          color: white,
                          maxLine: 1,
                          size: 20,
                          text: equation.equation,
                        ),
                      ),
                    ],
                  ),
                ),
                vSpace(10),
                Consumer<CalculatorProvider>(
                  builder: (context, equation, child) => textBold(
                          color: black,
                          maxLine: 1,
                          size: 35,
                          text: equation.result != '' ? equation.result : '0',
                        ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              color: blue,
              child: GridView.count(
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.all(10.0),
                crossAxisSpacing: 5.0,
                childAspectRatio: 1.3,
                mainAxisSpacing: 5.0,
                crossAxisCount: 4,
                children: buttons,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
