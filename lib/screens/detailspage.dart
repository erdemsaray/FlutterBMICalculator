import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class DetailsPage extends StatefulWidget {
  final int bmi;
  final String result;
  final String comment;

  const DetailsPage({Key? key, required this.bmi, required this.comment, required this.result}) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  TextStyle resultTextStyle = const TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  TextStyle valuesTextStyle = const TextStyle(fontSize: 20, fontWeight: FontWeight.bold);
  bool splashValue = false;

  Color resultColor = Colors.green;
  @override
  void initState() {
    super.initState();
    if (widget.result == "Overweight") {
      resultColor = Colors.red;
    } else if (widget.result == "Underweight") {
      resultColor = Colors.yellow;
    }

    animationDispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Color.fromARGB(255, 3, 123, 236),
            Color.fromARGB(255, 0, 0, 0),
          ],
        )),
        child: !splashValue
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "CALCULATING...",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Lottie.asset('assets/calculate.json'),
                  ),
                ],
              )
            : SafeArea(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "YOUR BMI RESULT",
                          style: resultTextStyle,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          widget.result,
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: resultColor,
                          ),
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        Text(
                          "YOUR BODY MASS INDEX",
                          style: resultTextStyle,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "${widget.bmi}",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: resultColor,
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        Text(
                          "COMMENT",
                          style: resultTextStyle,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: SizedBox(
                            width: 300,
                            child: Text(
                              widget.comment,
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: resultColor,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
      ),
    );
  }

  void animationDispose() async {
    await Future.delayed(const Duration(seconds: 2));
    splashValue = true;
    setState(() {});
  }
}
