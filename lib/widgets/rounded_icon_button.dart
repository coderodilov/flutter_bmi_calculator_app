import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class RoundedIconButton extends StatelessWidget {
  const RoundedIconButton({
    super.key,
    required this.icon,
    required this.onPressed

  });

  final IconData icon;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      elevation: 6,
      constraints: const BoxConstraints.tightFor(
        width: 50,
        height: 50,
      ),
      shape: const CircleBorder(),
      fillColor: roundedIconButtonFillColor,
      child: Icon(icon),

    );
  }
}
