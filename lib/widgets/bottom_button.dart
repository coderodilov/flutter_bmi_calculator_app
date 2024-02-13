import 'package:flutter/material.dart';
import '../utils/app_constants.dart';

class BottomButton extends StatelessWidget {
  const BottomButton({
    super.key,
    required this.title,
    required this.fillColor,
    required this.onPress,
    this.height = bottomButtonHeight,
  });

  final String title;
  final Color fillColor;
  final Function() onPress;
  final double height;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        decoration: BoxDecoration(
            color: fillColor,
            borderRadius: BorderRadius.circular(15)
        ),
        alignment: Alignment.center,
        height: height,
        width: double.infinity,
        child:  Text(title, style: calculateButtonTextStyle,),
      ),
    );
  }
}