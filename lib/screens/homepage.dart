import 'package:bmi_calculator/utils/calculateManager.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color cardBackgroundColor = const Color.fromARGB(255, 18, 58, 91);
  ButtonStyle elevatedButtonStyle = ButtonStyle(
      backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 18, 58, 91)),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18.0),
      )),
      elevation: MaterialStateProperty.all(50));
  bool genderValue = false;
  int valueHeight = 170;
  int valueAge = 30;
  int valueWeight = 65;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Color.fromARGB(255, 204, 36, 194),
            Color.fromARGB(255, 227, 5, 5),
          ],
        )),
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            style: elevatedButtonStyle,
                            onPressed: !genderValue
                                ? null
                                : () {
                                    setState(() {
                                      genderValue = false;
                                    });
                                  },
                            child: SizedBox(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.male,
                                    color: Colors.blue,
                                    size: 100,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Male",
                                        textAlign: TextAlign.right,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Visibility(
                                        visible: !genderValue,
                                        child: Icon(
                                          Icons.check,
                                          size: 20,
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                              height: 160,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                            child: ElevatedButton(
                          style: elevatedButtonStyle,
                          onPressed: genderValue
                              ? null
                              : () {
                                  setState(() {
                                    genderValue = true;
                                  });
                                },
                          child: SizedBox(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.female, size: 100, color: Colors.pink),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("Female"),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Visibility(
                                      visible: genderValue,
                                      child: Icon(
                                        Icons.check,
                                        size: 20,
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                            height: 160,
                          ),
                        )),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      child: Row(
                        children: [
                          Expanded(
                            child: Card(
                                elevation: 20,
                                color: cardBackgroundColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18),
                                ),
                                child: SizedBox(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Text(
                                        "HEIGHT",
                                        style: TextStyle(fontSize: 25),
                                      ),
                                      Text(
                                        "$valueHeight",
                                        style: TextStyle(fontSize: 25),
                                      ),
                                      Slider(
                                          value: valueHeight.toDouble(),
                                          onChanged: (value) {
                                            setState(() {
                                              valueHeight = value.toInt();
                                            });
                                          },
                                          min: 120,
                                          max: 220)
                                    ],
                                  ),
                                  height: 160,
                                )),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          child: Card(
                              elevation: 20,
                              color: cardBackgroundColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18),
                              ),
                              child: SizedBox(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "AGE",
                                      style: TextStyle(fontSize: 30, fontWeight: FontWeight.w300),
                                    ),
                                    Text(
                                      "$valueAge",
                                      style: TextStyle(
                                        fontSize: 40,
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        ElevatedButton(
                                          child: Icon(Icons.remove),
                                          onPressed: () {
                                            setState(() {
                                              valueAge--;
                                            });
                                          },
                                          style: ElevatedButton.styleFrom(shape: CircleBorder()),
                                        ),
                                        ElevatedButton(
                                          child: Icon(Icons.add),
                                          onPressed: () {
                                            setState(() {
                                              valueAge++;
                                            });
                                          },
                                          style: ElevatedButton.styleFrom(shape: CircleBorder()),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                                height: 160,
                              )),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Card(
                              elevation: 20,
                              color: cardBackgroundColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18),
                              ),
                              child: SizedBox(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "WEIGHT",
                                      style: TextStyle(fontSize: 30, fontWeight: FontWeight.w300),
                                    ),
                                    Text(
                                      "$valueWeight",
                                      style: TextStyle(
                                        fontSize: 40,
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        ElevatedButton(
                                          child: Icon(Icons.remove),
                                          onPressed: () {
                                            setState(() {
                                              valueWeight--;
                                            });
                                          },
                                          style: ElevatedButton.styleFrom(shape: CircleBorder()),
                                        ),
                                        ElevatedButton(
                                          child: Icon(Icons.add),
                                          onPressed: () {
                                            setState(() {
                                              valueWeight++;
                                            });
                                          },
                                          style: ElevatedButton.styleFrom(shape: CircleBorder()),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                                height: 160,
                              )),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 10),
                    child: Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              int bodyMassIndex = CalculateManager().calculateBMI(valueHeight, valueWeight, valueAge);
                              String result = CalculateManager().evaluateBMIResult(bodyMassIndex);
                              String comment = CalculateManager().getComment(bodyMassIndex);

                              print("BMI: $bodyMassIndex, Result: $result, Comment: $comment ");
                            },
                            child: const SizedBox(
                              child: Center(
                                  child: Text(
                                "CALCULATE",
                                style: TextStyle(fontSize: 30),
                              )),
                              height: 120,
                            ),
                            style: elevatedButtonStyle,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
