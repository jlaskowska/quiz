import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String buttonLabel;
  final Function onPressed;

  Button({@required this.buttonLabel, @required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      minWidth: 120,
      height: 60,
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        color: Theme.of(context).accentColor,
        child: Text(buttonLabel),
        onPressed: onPressed,
      ),
    );
  }
}
