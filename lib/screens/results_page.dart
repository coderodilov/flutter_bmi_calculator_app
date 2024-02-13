import 'package:flutter/material.dart';
import 'package:flutter_bmi_calculator_app/widgets/reusable_card.dart';
import '../utils/app_colors.dart';
import '../utils/app_constants.dart';
import '../widgets/bottom_button.dart';

class ResultsPage extends StatelessWidget {
  const ResultsPage({
    super.key,
    required this.bmiResult,
    required this.resultText,
    required this.interpretation
  });

  final String bmiResult;
  final String resultText;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: const Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                 child: const Text('Your Result',
                 style: resultTitleTextStyle,)
          )
          ),
          Expanded(
            flex: 5,
              child: ReUsableCard(
                 cardChild:  Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                   children: [
                     Text(resultText, style: resultAnswerTextStyle),

                     Text(bmiResult, style: resultBMITextStyle,),

                     Text(interpretation,
                       textAlign: TextAlign.center,
                       style: resultBodyTextStyle,),
              ],
            ),
            color: activeCardColor,
            onPress: () {  },)
          ),

          BottomButton(
            title: 'RE-CALCULATE',
            fillColor: bottomButtonFillColor,
            onPress: () {
              Navigator.pop(context);
            },
          ),

        ],
      ),
    );
  }
}


