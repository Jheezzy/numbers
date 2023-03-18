import 'package:flutter/material.dart';

class Numbers extends StatefulWidget {
  const Numbers({super.key});

  @override
  State<Numbers> createState() => _NumbersState();
}

class _NumbersState extends State<Numbers> {
  String displayedText = '';
  // String result = '';
  //I could use displayedText or choose to create a new variable and give it an empty string like displayedText
  // the sum or difference or shit of numberOne and numberTwo
  String operation = '';
  //whether it is plus or minus or shit
  int numberOne = 0;
  int numberTwo = 0;

  void calculation(String buttonText) {
    if (buttonText == '+') {
      numberOne = int.parse(displayedText);
      // Take the displayed text which is the first number i just entered, store it in a variable called numberOne
      operation = buttonText;
      // Take the buttonText i just pressed which is +, store it in a variable called operation
      displayedText = '';
      // Take an empty String and store it in a variable called result
    } else if (buttonText == '=') {
      numberTwo = int.parse(displayedText);
      // Take the second number i entered after pressing +, store it in a variable called numberTwo
      if (operation == '+') {
        displayedText = (numberOne + numberTwo).toString();
        // If my operation i pressed was + then add numberOne and numberTwo, the store the answer in a variable called result
      }
    } else if (buttonText == 'RESET') {
      displayedText = '';
      // result = '';
      operation = '';
      numberOne = 0;
      numberTwo = 0;
    } else {
      displayedText = buttonText;
      // If i don't press an operation or RESET or = , store displayed text on my screen which is an empty string or screen at this point plus the buttonText i pressed in a variable called result

    }

    setState(() {
      displayedText;
      // Change the state of my displayed text
    });
  }

  Widget buildButton(String buttonText) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        fixedSize: Size(128, 50),
        backgroundColor: Color.fromRGBO(255, 238, 170, 1),
        side: BorderSide(color: Colors.black),
      ),
      onPressed: () => calculation(buttonText),
      child: Text(
        buttonText,
        style: TextStyle(fontSize: 30, color: Colors.black),
      ),
    );
  }

  // void displayNumber(String buttonText) {
  //   setState(() {
  //     displayedText = buttonText;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Numbers App'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              displayedText,
              style: TextStyle(fontSize: 100),
            ),
          ),
          SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buildButton('1'),
              buildButton('2'),
              buildButton('3'),
            ],
          ),
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buildButton('RESET'),
              buildButton('+'),
              buildButton('='),
            ],
          ),
        ],
      ),
    );
  }
}
