import 'package:flutter/material.dart';
import 'package:flutter_bmi_calculator_app/screens/input_page.dart';
import 'package:flutter_bmi_calculator_app/utils/app_colors.dart';

void main() {
  runApp(const BMICalculator());
}

class BMICalculator extends StatelessWidget {
  const BMICalculator({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: primaryColor,
        scaffoldBackgroundColor: primaryColor,
      ),
      debugShowCheckedModeBanner: false,
      home: const InputPage(),
    );
  }
}



