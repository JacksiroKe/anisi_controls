import 'package:flutter/material.dart';

/// Stateful TextView control
class AsTextView extends StatefulWidget {
  final String text;
  final double fsize;
  final bool isbold;
  AsTextViewState widgetState;

  AsTextView(
    {
      this.text,
      this.fsize,
      this.isbold
    }
  );

  @override
  createState() => widgetState = new AsTextViewState( text: this.text, fsize: this.fsize, isbold: this.isbold );

  void setText(String newtext) {
    widgetState.setNewText(newtext);
  }

  void setSize(double newfontsize) {
    widgetState.setNewFontSize(newfontsize);
  }

  static Widget setUp(String defaultText, double textFontsize, bool isTextbold) {
    return new AsTextView(
      text: defaultText,
      fsize: textFontsize ,
      isbold: isTextbold   
    );
  }
}

class AsTextViewState extends State<AsTextView> {
  String text;
  double fsize;
  bool isbold;

  AsTextViewState( { this.text, this.fsize, this.isbold } );

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontWeight: isbold ? FontWeight.bold : FontWeight.normal, fontSize: fsize),
    );
  }

  void setNewText(String newText) {
    setState(() { text = newText; });
  }
  
  void setNewFontSize(double newFontsize) {
    setState(() { fsize = newFontsize; });
  }

}
