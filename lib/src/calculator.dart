import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:math_expressions/math_expressions.dart';
import 'default_btn.dart';
import 'equals_btn.dart';

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String values, result;
  Color background = Color(0xFFF5F7F9);

  @override
  void initState() {
    values = "0";
    result = "";
    super.initState();
  }

  void setVal(String val){
    setState(() {
      if (values == "0")
        values = val;
      else
        values+= val;
    });
  }

  void clear(){
    setState(() {
      values = "0";
      result = "";
    });
  }

  void delete(){
    setState(() {
      values = (values.length>1 && values != "0")  ? values.substring(0,values.length-1) : "0";
    });
  }

  void calculate(){
    try {
      Parser p = new Parser();
      ContextModel cm = new ContextModel();
      Expression exp = p.parse(values);
      setState(() {
        result = exp.evaluate(EvaluationType.REAL, cm).toString();
      });
    } catch (e) {
      setState(() {
        result = "Sintaxis Error";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Text(values, textAlign: TextAlign.right, style: TextStyle(fontSize: 30)),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Text(result, textAlign: TextAlign.right, style: TextStyle(fontSize: 32,fontWeight: FontWeight.bold)),
          ),
          SizedBox( height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Default(text: 'AC',background: background, onPress: (){}),
              Default(icon: Icon(Icons.backspace), background: background, onPress: (){}),
              Default(text: '%', background: background, onPress: (){}),
              Default(text: '/', background: background, onPress: (){}),
            ]
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Default(text: '7',onPress: (){}),
              Default(text: '8',onPress: (){}),
              Default(text: '9',onPress: (){}),
              Default(text: '*',background: background,onPress: (){}),
            ]
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Default(text: '4',onPress: () {}),
              Default(text: '5',onPress: () {}),
              Default(text: '6',onPress: () {}),
              Default(text: '-',background: background,onPress: (){}),
            ]
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Default(text: '1',onPress: (){}),
              Default(text: '2',onPress: (){}),
              Default(text: '3',onPress: (){}),
              Default(text: '+',background: background,onPress: (){}),
            ]
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Default(text: '0',onPress: (){}),
              Default(text: '.',onPress: (){}),
              Equals(onPress: calculate)
            ]
          )
        ],
      )
    );
  }
}