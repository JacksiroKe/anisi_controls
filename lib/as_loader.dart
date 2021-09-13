import 'package:flutter/material.dart';

/// Indefinate Informer widget with Text view on it
// ignore: must_be_immutable
class AsLoader extends StatefulWidget {
  /// General Color of the widget
  Color? color;
  bool? opacity;
  late AsLoaderState widgetState;

  AsLoader({this.color, this.opacity});

  @override
  createState() => widgetState = AsLoaderState(color: this.color, opacity: this.opacity);

  /// initial setting up of the widget
  static Widget setUp(Color setColor, bool setOpacity) {
    return AsLoader(color: setColor, opacity: setOpacity);
  }

  /// hide the widget is its already being shown
  void hide() {
    widgetState.hide();
  }

  /// show the widget is its already hidden, has to be called if the widget has been created freshly
  void show() {
    widgetState.show();
  }

  /// change the outlook of the widgeton the fly
  void modify(Color newColor) {
    widgetState.modify(newColor);
  }
}

class AsLoaderState extends State<AsLoader> {
  Color? color;

  bool _opacity = false;

  AsLoaderState({this.color, bool? opacity});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: !_opacity
          ? null
          : Opacity(
              opacity: _opacity ? 1 : 0,
              child: Container(
                decoration: new BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: color!),
                  boxShadow: [BoxShadow(blurRadius: 5)],
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
                margin: const EdgeInsets.all(20),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(color),
                  ),
                ),
              ),
            ),
    );
  }

  void hide() {
    setState(() {
      _opacity = false;
    });
  }

  void show() {
    setState(() {
      _opacity = true;
    });
  }

  void modify(Color newColor) {
    setState(() {
      color = newColor;
    });
  }
}
