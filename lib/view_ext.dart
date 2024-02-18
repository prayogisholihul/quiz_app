import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ButtonRounded extends StatelessWidget {
  const ButtonRounded(this.setClick, this.text, {key});
  final String text;
  final Function setClick;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: setClick,
      child: Text(
        text,
        style: TextStyle(color: Colors.black, fontSize: 14),
        textAlign: TextAlign.center,
      ),
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.white),
          minimumSize: MaterialStateProperty.all(Size(100, 35)),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24.0)))),
    );
  }
}

class StyledText extends StatelessWidget {
  const StyledText(this.text, this.color, {key});

  final String text;
  final Color color;

  @override
  Widget build(context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: 24,
      ),
    );
  }
}
