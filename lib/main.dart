import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import './widgets/CalcButton.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(CalcApp());
}

class CalcApp extends StatefulWidget {
  CalcApp({Key key}) : super(key: key);
  @override
  CalcAppState createState() => CalcAppState();
}

class CalcAppState extends State<CalcApp> {
  String _history = '';
  String _expression = '';

  void numClick(String text) {
    setState(() {
      _expression += text;
    });
  }

  void allClear(String text) {
    setState(() {
      _history = '';
      _expression = '';
    });
  }

  void clear(String text) {
    setState(() {
      _expression = '';
    });
  }

  void evaluate(String text) {
    Parser p = Parser();
    Expression exp = p.parse(_expression);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    setState(() {
      _history = _expression;
      _expression = eval.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xff283637),
        body:
            Column(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
          Container(
            padding: EdgeInsets.only(right: 12),
            child: Text(_history,
                style: GoogleFonts.rubik(
                    textStyle: TextStyle(fontSize: 30),
                    color: Color(0xff545f61))),
            alignment: Alignment(1, 1),
          ),
          Container(
            padding: EdgeInsets.all(12),
            child: Text(_expression,
                style: GoogleFonts.rubik(
                    textStyle: TextStyle(fontSize: 48), color: Colors.white)),
            alignment: Alignment(1, 1),
          ),
          SizedBox(height: 40),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                CalcButton(
                  text: 'AC',
                  fillColor: 0xff6c807f,
                  textSize: 24,
                  callback: allClear,
                ),
                CalcButton(
                  text: 'C',
                  fillColor: 0xff6c807f,
                  callback: clear,
                ),
                CalcButton(
                  text: '%',
                  fillColor: 0xffffffff,
                  callback: numClick,
                  textColor: 0xff65bdac,
                ),
                CalcButton(
                  text: '/',
                  fillColor: 0xffffffff,
                  callback: numClick,
                  textColor: 0xff65bdac,
                ),
              ]),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                CalcButton(
                  text: '7', callback: numClick,
                  // fillColor: 0xff6c807f,
                ),
                CalcButton(
                  text: '8', callback: numClick,
                  // fillColor: 0xff6c807f,
                ),
                CalcButton(
                  text: '9', callback: numClick,
                  // fillColor: 0xffffffff,
                  // textColor: 0xff65bdac,
                ),
                CalcButton(
                  text: '*',
                  callback: numClick,
                  fillColor: 0xffffffff,
                  textColor: 0xff65bdac,
                ),
              ]),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                CalcButton(
                  text: '4', callback: numClick,
                  // fillColor: 0xff6c807f,
                ),
                CalcButton(
                  text: '5', callback: numClick,
                  // fillColor: 0xff6c807f,
                ),
                CalcButton(
                  text: '6', callback: numClick,
                  // fillColor: 0xffffffff,
                  // textColor: 0xff65bdac,
                ),
                CalcButton(
                  text: '-',
                  callback: numClick,
                  fillColor: 0xffffffff,
                  textColor: 0xff65bdac,
                ),
              ]),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                CalcButton(
                  text: '1', callback: numClick,

                  // fillColor: 0xff6c807f,
                ),
                CalcButton(
                  text: '2', callback: numClick,
                  // fillColor: 0xff6c807f,
                ),
                CalcButton(
                  text: '3', callback: numClick,
                  // fillColor: 0xffffffff,
                  // textColor: 0xff65bdac,
                ),
                CalcButton(
                  text: '+',
                  callback: numClick,
                  fillColor: 0xffffffff,
                  textColor: 0xff65bdac,
                ),
              ]),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                CalcButton(
                  text: '.', callback: numClick,
                  // fillColor: 0xff6c807f,
                ),
                CalcButton(
                  text: '0', callback: numClick,
                  // fillColor: 0xff6c807f,
                ),
                CalcButton(
                  text: '00', callback: numClick,
                  textSize: 24,
                  // fillColor: 0xffffffff,
                  // textColor: 0xff65bdac,
                ),
                CalcButton(
                  text: '=',
                  callback: evaluate,
                  fillColor: 0xffffffff,
                  textColor: 0xff65bdac,
                ),
              ])
        ]),
      ),
    );
  }
}
