import 'package:flutter/material.dart';

class DetailsPage extends StatefulWidget {
  final int bmi;
  final String result;
  final String comment;

  const DetailsPage({Key? key, required this.bmi, required this.comment, required this.result}) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  TextStyle resultTextStyle = const TextStyle(fontSize: 30);
  Color resultColor = Colors.green;

  @override
  void initState() {
    if (widget.result == "Overweight") {
      resultColor = Colors.red;
    } else if (widget.result == "Underweight") {
      resultColor = Colors.yellow;
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color.fromARGB(255, 18, 23, 57),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 50, bottom: 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Expanded(
                  child: Text(
                    "RESULT",
                    style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Expanded(
                  child: Text(
                    widget.result,
                    style: TextStyle(fontSize: 30, color: resultColor),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Expanded(
                  child: Text(
                    "YOUR BODY MASS INDEX",
                    style: resultTextStyle,
                  ),
                ),
                Expanded(
                  child: Text(
                    "${widget.bmi}",
                    style: TextStyle(fontSize: 35, color: resultColor),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: Text(
                    "COMMENT",
                    style: resultTextStyle,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 12, left: 12),
                    child: Text(
                      widget.comment,
                      style: TextStyle(fontSize: 20, color: resultColor),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
