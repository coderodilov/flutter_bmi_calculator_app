import 'package:flutter/cupertino.dart';

class ReUsableCard extends StatelessWidget {
  const ReUsableCard({super.key,
    required this.cardChild,
    required this.color,
    required this.onPress
  });

  final Widget cardChild;
  final Color color;
  final Function() onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),
        margin: const EdgeInsets.all(15),
        child: cardChild,
      ),
    );
  }
}