import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CalcButton extends StatelessWidget {
  final String text;
  final int fillColor;
  final int textColor;
  final double textSize;
  final Function callback;
  const CalcButton(
      {Key key,
      this.text,
      this.fillColor,
      this.textColor = 0xffffffff,
      this.textSize = 28,
      this.callback})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    return Container(
      margin: EdgeInsets.all(8),
      child: SizedBox(
        width: 65,
        height: 65,
        // ignore: deprecated_member_use
        child: FlatButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
          child: Text(text,
              style:
                  GoogleFonts.rubik(textStyle: TextStyle(fontSize: textSize))),
          onPressed: () {
            callback(text);
          },
          color: fillColor != null ? Color(fillColor) : null,
          textColor: Color(textColor),
        ),
      ),
    );
  }
}
