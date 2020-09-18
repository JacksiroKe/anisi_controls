import 'dart:ui' as ui;
import 'package:flutter/material.dart';

const double kIconOff = -3;
const double kIconOn = 0;
const double kTextOff = 4;
const double kTextOn = 1;
const double kAlphaOff = 0;
const double kAlphaOn = 1;
const int kAnimDuration = 300;

class TabItem extends StatelessWidget {
  TabItem(
      {@required this.uniqueKey,
      @required this.selected,
      this.iconData,
      this.icon,
      @required this.title,
      @required this.callbackFunction,
      @required this.titleStyle,
      @required this.iconColor,
      this.iconSize,
      this.animDuration,
      this.gradient});

  final UniqueKey uniqueKey;
  final String title;
  final IconData iconData;
  final Widget icon;
  final bool selected;
  final Function(UniqueKey uniqueKey) callbackFunction;
  final TextStyle titleStyle;
  final Color iconColor;
  final double iconSize;
  final int animDuration;
  final Gradient gradient;

  final double iconYAlign = kIconOn;
  final double textYAlign = kTextOff;
  final double iconAlpha = kAlphaOn;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            child: AnimatedAlign(
                duration: Duration(milliseconds: animDuration),
                alignment: Alignment(0, (selected) ? kTextOn : kTextOff),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text(
                    title,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: titleStyle,
                  ),
                )),
          ),
          Container(
            height: double.infinity,
            width: double.infinity,
            child: AnimatedAlign(
              duration: Duration(milliseconds: animDuration),
              curve: Curves.easeIn,
              alignment: Alignment(0, (selected) ? kIconOff : kIconOn),
              child: AnimatedOpacity(
                duration: Duration(milliseconds: animDuration),
                opacity: (selected) ? kAlphaOff : kAlphaOn,
                child: IconButton(
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  padding: EdgeInsets.all(0),
                  alignment: Alignment(0, 0),
                  icon: this.gradient != null
                    ? ShaderMask(
                      blendMode: BlendMode.srcIn,
                      shaderCallback: (Rect bounds) {
                        return ui.Gradient.linear(Offset(4.0, 24.0),
                          Offset(24.0, 4.0), gradient.colors);
                      },
                      child: icon != null ? SizedBox(width: iconSize, height: iconSize, child: icon) 
                        : Icon(iconData, size: iconSize),
                    )
                    : icon != null ? SizedBox(width: iconSize, height: iconSize, child: icon) 
                      : Icon(
                        iconData,
                        color: iconColor,
                        size: iconSize,
                      ),
                  onPressed: () {
                    callbackFunction(uniqueKey);
                  },
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
