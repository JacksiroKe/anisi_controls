import 'package:flutter/material.dart';

/// Stateful TextView control
class AsTextView extends StatefulWidget {
  String text;
  double fsize;
  bool isbold;
  Color color;
  Color backgroundColor;

  AsTextViewState widgetState;

  AsTextView(
    {
      this.text,
      this.fsize,
      this.isbold,
      this.color,
      this.backgroundColor,
    }
  );

  @override
  createState() => widgetState = new AsTextViewState( text: this.text, fsize: this.fsize, isbold: this.isbold, color: this.color );

  void setText(String newtext) {
    widgetState.setNewText(newtext);
  }

  void setSize(double newfontsize) {
    widgetState.setNewFontSize(newfontsize);
  }

  static Widget setUp(String defaultText, double textFontsize, bool isTextbold, Color color, Color backgroundColor) {
    return new AsTextView(
      text: defaultText,
      fsize: textFontsize,
      isbold: isTextbold,  
      color: color,
      backgroundColor: backgroundColor,
    );
  }
  
  void modify(String defaultText, double textFontsize, bool isTextbold, Color color, Color backgroundColor) {    
    widgetState.modifyWidget(defaultText, textFontsize, isTextbold, color, backgroundColor);
  }
}

class AsTextViewState extends State<AsTextView> {
  String text;
  double fsize;
  bool isbold;
  Color color;
  Color backgroundColor;

  AsTextViewState( { this.text, this.fsize, this.isbold, this.color, this.backgroundColor } );

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontWeight: isbold ? FontWeight.bold : FontWeight.normal, fontSize: fsize, color: color, backgroundColor: backgroundColor),
    );
  }

  void setNewText(String newText) {
    setState(() { text = newText; });
  }
  
  void setNewFontSize(double newFontsize) {
    setState(() { fsize = newFontsize; });
  }

  void modifyWidget(String defaultText, double textFontsize, bool isTextbold, Color color, Color backgroundColor) {
    setState(() {
      defaultText = defaultText;
      textFontsize = textFontsize;
      isTextbold = isTextbold;
      color = color;
      backgroundColor = backgroundColor;
    });
  }

}
