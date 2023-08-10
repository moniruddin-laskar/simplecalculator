import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simplecalculator/appstate/calculator_provider.dart';
import 'package:simplecalculator/const/colors.dart';
import 'package:simplecalculator/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CalculatorProvider>(
      create: (_) => CalculatorProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Simple Calculator',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          scaffoldBackgroundColor: grey,
          appBarTheme: AppBarTheme(
            color: blue,
            elevation: 5,
          ),
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
