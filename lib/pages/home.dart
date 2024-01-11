import 'package:flashcard/pages/flashCard.dart';
import 'package:flashcard/pages/flashcardView.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_math_fork/ast.dart';
import 'package:flutter_math_fork/flutter_math.dart';
import 'package:flutter_math_fork/tex.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_swipe_detector/flutter_swipe_detector.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<FlashCard> _flashCard = [
    FlashCard(
      question: Math.tex(
        "Mass-energy\\ equation?",
        textStyle: TextStyle(fontWeight: FontWeight.w700, fontSize: 21),
      ),
      answer: Math.tex('E = mc^2',
          textStyle: TextStyle(fontWeight: FontWeight.w700, fontSize: 22)),
    ),
    FlashCard(
        question: Math.tex("Ideal\\ gas\\ law:",
            textStyle: TextStyle(fontWeight: FontWeight.w700, fontSize: 22)),
        answer: Math.tex('pH = -\log_{10}[H^+]',
            textStyle: TextStyle(fontWeight: FontWeight.w700, fontSize: 22))),
    FlashCard(
        question: Math.tex("Arrhenius\\ equation",
            textStyle: TextStyle(fontWeight: FontWeight.w700, fontSize: 22)),
        answer: Math.tex("k = Ae^{-Ea/RT}",
            textStyle: TextStyle(fontWeight: FontWeight.w700, fontSize: 22)))
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: appBar(),
        body: scienceSection());
  }

  Column scienceSection() {
    return Column(
      children: [
        SizedBox(
          height: 40,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(padding: const EdgeInsets.only(left: 20)),
            Text(
              "Science : ",
              style: TextStyle(
                  color: Colors.blue,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w700,
                  fontSize: 25),
            ),
            SvgPicture.asset(
              'assets/icons/science.svg',
              height: 35,
              width: 20,
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Column(
          children: [
            // old gesture
            SwipeDetector(
                onSwipeRight: (Offset) {
                  showNextCard();
                },
                onSwipeLeft: (offset) {
                  showPreviousCard();
                },
                child: SizedBox(
                  height: 250,
                  width: 300,
                  child: Center(
                      child: Card(
                          color: Color.fromARGB(255, 85, 196, 204),
                          child: FlipCard(
                              front: Padding(
                                  padding: EdgeInsets.all(10),
                                  child: FlashCardView(
                                      text:
                                          _flashCard[_currentIndex].question)),
                              back: FlashCardView(
                                  text: _flashCard[_currentIndex].answer)))),
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                OutlinedButton.icon(
                    onPressed: () {
                      showPreviousCard();
                    },
                    icon: SvgPicture.asset('assets/icons/left.svg'),
                    label: Text('Prev')),
                OutlinedButton.icon(
                    onPressed: () {
                      showNextCard();
                    },
                    icon: SvgPicture.asset('assets/icons/left.svg'),
                    label: Text('Next'))
              ],
            ),
          ],
        )
      ],
    );
  }

  void showNextCard() {
    print(_currentIndex);
    setState(() {
      _currentIndex =
          (_currentIndex + 1 < _flashCard.length) ? _currentIndex + 1 : 0;
    });
  }

  void showPreviousCard() {
    setState(() {
      _currentIndex =
          (_currentIndex - 1 >= 0) ? _currentIndex - 1 : _flashCard.length - 1;
    });
  }

  AppBar appBar() {
    return AppBar(
      title: Text(
        "FlashFormula",
        style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontStyle: FontStyle.italic,
            fontSize: 30),
      ),
      backgroundColor: Colors.black,
      centerTitle: true,
    );
  }
}
