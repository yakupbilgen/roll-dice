import 'dart:math';

import 'package:flutter/material.dart';

main(List<String> args) {
  runApp(MaterialApp(
    home: RollDice(),
  ));
}

class RollDice extends StatefulWidget {
  @override
  _RollDiceState createState() => _RollDiceState();
}

class _RollDiceState extends State<RollDice> {
  int diceOneCount = 0;
  int diceTwoCount = 0;
  String diceOneImage = 'assets/images/0.png';
  String diceTwoImage = 'assets/images/0.png';
  int totalDiceCount = 0;
  String title = 'Total Roll Dice';
  String buttonText = 'Roll Dice';

  buildRollDice() {
    Random rnd = Random();
    diceOneCount = rnd.nextInt(7);
    if (diceOneCount == 0) {
      diceOneCount++;
    }
    diceOneImage = "assets/images/$diceOneCount.png";

    diceTwoCount = rnd.nextInt(7);
    if (diceTwoCount == 0) {
      diceTwoCount++;
    }
    diceTwoImage = "assets/images/$diceTwoCount.png";
    totalDiceCount++;

    buttonText = 'Try Again';
    setState(() {});
  }

  clearDiceRoll() {
    diceOneCount = 0;
    diceTwoCount = 0;
    totalDiceCount = 0;
    diceOneImage = 'assets/images/0.png';
    diceTwoImage = 'assets/images/0.png';
    buttonText = 'Zar At';
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text(title + " = " + totalDiceCount.toString()),
        centerTitle: true,
      ),
      body: Container(
        child: Center(
          child: Column(
            children: [
              Padding(padding: EdgeInsets.only(top: 10)),
              Expanded(
                  child: SizedBox(
                height: deviceSize.height,
                child: Column(
                  children: [
                    SizedBox(
                      height: deviceSize.height * 0.3,
                      child: Image.asset(diceOneImage),
                    ),
                    Padding(padding: EdgeInsets.only(top: 10)),
                    SizedBox(
                      height: deviceSize.height * 0.3,
                      child: Image.asset(diceTwoImage),
                    ),
                    Padding(padding: EdgeInsets.only(top: 10)),
                    ElevatedButton(
                      onPressed: () => buildRollDice(),
                      child: Text(buttonText, style: TextStyle(fontSize: 40)),
                    ),
                    Padding(padding: EdgeInsets.only(top: 10)),
                    ElevatedButton(
                      onPressed: () => clearDiceRoll(),
                      child: Text('Reset', style: TextStyle(fontSize: 30)),
                    ),
                  ],
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
