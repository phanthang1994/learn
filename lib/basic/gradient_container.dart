import 'package:flutter/material.dart';
import 'package:untitled1/basic/dice_roller.dart';
import 'styled_text.dart';

const startAlignment = Alignment.topLeft;
const endAlignment =  Alignment.bottomRight;

class GradientContainer extends StatelessWidget {
  const GradientContainer({super.key, colors, required this.colours1, required this.colours2});
  const GradientContainer.purple({super.key })
      : colours1 = Colors.deepPurple,
        colours2 = Colors.indigo;

  final Color colours2;
  final Color colours1;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
           colours1,
            colours2
          ],
        )
      ),
      child: Center(
        child: DiceRoller()
      ),
    );
  }
}
