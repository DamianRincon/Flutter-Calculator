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
      
    );
  }
}