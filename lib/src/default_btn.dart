import 'package:flutter/material.dart';

class Default extends StatelessWidget {
  final Color background;
  final String text;
  final Function onPress;
  final Icon icon;

  const Default({Key key, this.background, this.text, this.onPress, this.icon}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 10.0),
      child: FlatButton(
        child: icon == null ? Text(
          text,
          style: TextStyle(fontSize: 28.0, color: Colors.blueGrey.shade900),
        ) : icon,
        onPressed: onPress,
        color: background,
        padding: EdgeInsets.all(18.0),
        splashColor: Color(0xffB24592),
        shape: CircleBorder(),
      )
    );
  }
}