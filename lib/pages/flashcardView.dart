import 'package:flutter/material.dart';
import 'package:flutter_math_fork/flutter_math.dart';

class FlashCardView extends StatelessWidget {
  final Math text;
  const FlashCardView({required this.text});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color.fromARGB(255, 85, 196, 204),
      //color: Color.fromARGB(255, 30, 215, 96),
      elevation: 0,
      child: Center(child: text),
    );
  }
}
