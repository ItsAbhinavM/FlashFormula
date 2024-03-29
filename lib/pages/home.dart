import 'package:flashcard/pages/flashCard.dart';
import 'package:flashcard/pages/flashcardView.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
//import 'package:flutter_math_fork/ast.dart';
import 'package:flutter_math_fork/flutter_math.dart';
//import 'package:flutter_math_fork/tex.dart';
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
        "Mass-energy\\ eqn?",
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

  final List<FlashCard> _flashCard1 = [
    FlashCard(
      question: Math.tex(
        "Pythagorus\\ theorem?",
        textStyle: TextStyle(fontWeight: FontWeight.w700, fontSize: 21),
      ),
      answer: Math.tex('a^2\\ +\\ b^2\\ =\\ c^2',
          textStyle: TextStyle(fontWeight: FontWeight.w700, fontSize: 22)),
    ),
    FlashCard(
        question: Math.tex("Definite\\ integral",
            textStyle: TextStyle(fontWeight: FontWeight.w700, fontSize: 22)),
        answer: Math.tex('\int_a^b f(x) \ dx',
            textStyle: TextStyle(fontWeight: FontWeight.w700, fontSize: 22))),
    FlashCard(
        question: Math.tex("Area\\ under\\ Curve",
            textStyle: TextStyle(fontWeight: FontWeight.w700, fontSize: 22)),
        answer: Math.tex("\int_a^b f(x) \ dx",
            textStyle: TextStyle(fontWeight: FontWeight.w700, fontSize: 22)))
  ];

  int _currentIndexMath = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: appBar(),
        body: Column(children: [
          scienceSection(),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Padding(padding: const EdgeInsets.only(left: 20)),
              Text(
                "Math : ",
                style: TextStyle(
                    color: Colors.blue,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w700,
                    fontSize: 25),
              ),
              SvgPicture.asset(
                'assets/icons/calculator.svg',
                height: 30,
                width: 20,
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Column(
            children: [
              SizedBox(
                height: 250,
                width: 250,
                child: Center(
                  child: Card(
                    color: Color.fromARGB(255, 85, 196, 204),
                    child: SwipeDetector(
                      onSwipeLeft: (Offset) {
                        showNextMathCard();
                      },
                      onSwipeRight: (offset) {
                        showPreviousMathCard();
                      },
                      child: FlipCard(
                          front: FlashCardView(
                              text: _flashCard1[_currentIndexMath].question),
                          back: FlashCardView(
                              text: _flashCard1[_currentIndexMath].answer)),
                    ),
                  ),
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              OutlinedButton.icon(
                  onPressed: () {
                    showPreviousMathCard();
                  },
                  icon: SvgPicture.asset('assets/icons/left.svg'),
                  label: Text('Prev')),
              OutlinedButton.icon(
                  onPressed: () {
                    showNextMathCard();
                  },
                  icon: SvgPicture.asset('assets/icons/left.svg'),
                  label: Text('Next'))
            ],
          ),
        ]));
  }

  Column scienceSection() {
    return Column(
      children: [
        SizedBox(
          height: 30,
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
                  height: 200,
                  width: 250,
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

  void showNextMathCard() {
    setState(() {
      _currentIndexMath = (_currentIndexMath + 1 < _flashCard1.length)
          ? _currentIndexMath + 1
          : 0;
    });
  }

  void showPreviousCard() {
    setState(() {
      _currentIndex =
          (_currentIndex - 1 >= 0) ? _currentIndex - 1 : _flashCard.length - 1;
    });
  }

  void showPreviousMathCard() {
    setState(() {
      _currentIndexMath = (_currentIndexMath - 1 >= 0)
          ? _currentIndexMath - 1
          : _flashCard1.length - 1;
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
