import 'package:flutter/material.dart';

class Equals extends StatelessWidget {
  final Function onPress;
  const Equals({Key key, this.onPress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 10.0,left: 15.0, right: 15.0),
      width: 170,
      child: RaisedButton(
        elevation: 5,
        child: Text(
          '=',
          style: TextStyle(fontSize: 35.0,color: Colors.white),
        ),
        onPressed: onPress,
        color: Color(0xffB24592),
        padding: EdgeInsets.all(4.0),
        splashColor: Colors.white,
        shape:  RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50)
        ),
      )
    );
  }
}