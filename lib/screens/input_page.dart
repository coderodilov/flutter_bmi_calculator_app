import 'package:flutter/material.dart';
import 'package:flutter_bmi_calculator_app/screens/results_page.dart';
import 'package:flutter_bmi_calculator_app/utils/calculator_brain.dart';
import 'package:flutter_bmi_calculator_app/widgets/icon_content.dart';
import 'package:flutter_bmi_calculator_app/widgets/reusable_card.dart';
import 'package:flutter_bmi_calculator_app/widgets/rounded_icon_button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../utils/app_colors.dart';
import '../utils/app_constants.dart';
import '../widgets/bottom_button.dart';

enum Gender{
  male,
  female
}

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

   Gender selectedGender = Gender.male;

   int height = 180;
   int weight = 60;
   int age = 25;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Theme.of(context).primaryColor,
            title: const Text('BMI CALCULATOR')),
        body: Column(
          children: [
            Expanded(child: Row(
              children: [
                Expanded(
                    child: ReUsableCard(
                      onPress: () {
                        setState(() {
                           selectedGender = Gender.male;
                        });
                      },
                      color: selectedGender == Gender.male ? activeCardColor : inActiveCardColor,
                      cardChild: const IconContent(
                        icon: FontAwesomeIcons.mars,
                        label: 'MALE',
                      ),
                    )),

                Expanded(
                    child: ReUsableCard(
                      onPress: () {
                        setState(() {
                          selectedGender = Gender.female;
                        });
                      },
                      color: selectedGender == Gender.female ? activeCardColor : inActiveCardColor,
                      cardChild: const IconContent(
                          icon: FontAwesomeIcons.venus,
                          label: 'FEMALE'),
                    )),
              ],
            )),

            Expanded(child: ReUsableCard(
             onPress: () {
               // tap here
             },
             color: activeCardColor,
             cardChild:  Column(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                  const Text('HEIGHT', style: labelTextStyle,),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                   crossAxisAlignment: CrossAxisAlignment.baseline,
                   textBaseline: TextBaseline.alphabetic,
                   children: [
                     Text(height.toString(), style: numberTextStyle),
                     const Text('cm', style: labelTextStyle,)
                   ],
                 ),

                 SliderTheme(
                   data: SliderTheme.of(context).copyWith(
                     activeTrackColor: sliderInActiveTrackColor,
                     inactiveTrackColor: sliderInActiveColor,
                     thumbColor: sliderActiveColor,
                     overlayColor: sliderOverlayColor,
                     thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 15),
                     overlayShape: const RoundSliderOverlayShape(overlayRadius: 30),
                   ),
                   child: Slider(
                       value: height.toDouble(),
                       min: 120,
                       max: 220,
                       onChanged: (double value) {
                         setState(() {
                           height = value.round();
                         });
                       },
                   ),
                 )
               ],
             ),
           )),

            Expanded(child: Row(
             children: [
               Expanded(
                   child: ReUsableCard(
                     onPress: () {},
                     color: activeCardColor,
                     cardChild: Column(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                          const Text('WEIGHT', style: labelTextStyle,),
                          Text(weight.toString(), style: numberTextStyle),
                         Row(
                           mainAxisAlignment: MainAxisAlignment.center,
                           children: [
                             RoundedIconButton(
                                 icon: FontAwesomeIcons.minus,
                                 onPressed: () {
                                   setState(() {
                                     if(weight > 0){
                                       weight--;
                                     }
                                   });
                                 }
                             ),

                             const SizedBox(width: 20,),

                             RoundedIconButton(
                                 icon: FontAwesomeIcons.plus,
                                 onPressed: () {
                                   setState(() {
                                     if(weight < 180){
                                       weight++;
                                     }
                                   });
                                 }
                             ),
                           ],
                         )
                       ],
                     ),
                   )),

               Expanded(
                   child: ReUsableCard(
                     onPress: () {},
                     color: activeCardColor,
                     cardChild:  Column(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                         const Text('AGE', style: labelTextStyle,),
                         Text(age.toString(), style: numberTextStyle),
                         Row(
                           mainAxisAlignment: MainAxisAlignment.center,
                           children: [
                             RoundedIconButton(
                                 icon: FontAwesomeIcons.minus,
                                 onPressed: () {
                                   setState(() {
                                     if(age > 0){
                                       age--;
                                     }
                                   });
                                 }
                             ),

                             const SizedBox(width: 20,),

                             RoundedIconButton(
                                 icon: FontAwesomeIcons.plus,
                                 onPressed: () {
                                   setState(() {
                                     if(age < 120){
                                       age++;
                                     }
                                   });
                                 }
                             ),
                           ],
                         )
                       ],
                     ),
                   )
                ),
             ],
           )),

            BottomButton(
              title: 'CALCULATE',
              fillColor: bottomButtonFillColor,
              onPress: () {
                CalculatorBrain calc = CalculatorBrain(height: height, weight: weight);

                Navigator.push(context, MaterialPageRoute(builder: (context) =>
                   ResultsPage(
                      bmiResult: calc.calculateBMI(),
                      resultText: calc.getResult(),
                      interpretation: calc.getInterpretation())
                  ),
                );
                
              },
            )

          ],
        ));
  }
}








