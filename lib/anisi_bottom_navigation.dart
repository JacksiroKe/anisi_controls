library anisi_bottom_navigation;

import 'package:anisi_controls/internal/tab_item.dart';
import 'package:anisi_controls/paint/half_clipper.dart';
import 'package:anisi_controls/paint/half_painter.dart';
import 'package:flutter/material.dart';

class AnisiBottomNavigation extends StatefulWidget {
  AnisiBottomNavigation(
      {@required this.tabs,
      this.onTabChangedListener,
      this.key,
      this.initialSelection = 0,
      this.circleColor,
      this.circleHeight = 60,
      this.circleOutline = 10,
      this.arcHeight = 70,
      this.arcWidth = 90,
      this.shadowAllowance = 20,
      this.barHeight = 60,
      this.activeIconColor,
      this.inactiveIconColor,
      this.titleStyle = const TextStyle(),
      this.gradient,
      this.barBackgroundColor,
      this.shadowColor,
      this.shadowBlur = 8.0,
      this.inactiveIconSize,
      this.activeIconSize,
      this.animDuration = 300,
      this.pageController})
      : assert(onTabChangedListener != null || pageController != null),
        assert(tabs != null),
        assert(tabs.length > 1 && tabs.length <= 5);

  final Function(int position) onTabChangedListener;
  final Color circleColor;
  final Color activeIconColor;
  final Color inactiveIconColor;
  final TextStyle titleStyle;
  final Gradient gradient;
  final Color barBackgroundColor;
  final Color shadowColor;
  final double shadowBlur;
  final List<TabData> tabs;
  final int initialSelection;
  final int animDuration;
  final PageController pageController;
  final double circleHeight;
  final double circleOutline;
  final double arcHeight;
  final double arcWidth;
  final double shadowAllowance;
  final double barHeight;
  final double inactiveIconSize;
  final double activeIconSize;

  final Key key;

  @override
  AnisiBottomNavigationState createState() => AnisiBottomNavigationState();
}

class AnisiBottomNavigationState extends State<AnisiBottomNavigation>
    with TickerProviderStateMixin, RouteAware {
  IconData nextIcon = Icons.search;
  IconData activeIcon = Icons.search;
  Widget activeIconWidget;

  int currentSelected = 0;
  double _circleAlignX = 0;
  double _circleIconAlpha = 1;

  Color circleColor;
  Color activeIconColor;
  Color inactiveIconColor;
  Color barBackgroundColor;
  Gradient gradient;
  double activeIconSize;
  double inactiveIconSize;
  Color shadowColor;
  Function() _pageControllerListener;

  TextStyle themedTextStyle;

  @override
  void didChangeDependencies() {
    activeIcon = widget.tabs[currentSelected].iconData;
    activeIconWidget = widget.tabs[currentSelected].icon;

    circleColor = (widget.circleColor == null)
        ? (Theme.of(context).brightness == Brightness.dark)
            ? Colors.white
            : Theme.of(context).primaryColor
        : widget.circleColor;

    activeIconColor = (widget.activeIconColor == null)
        ? (Theme.of(context).brightness == Brightness.dark)
            ? Colors.black54
            : Colors.white
        : widget.activeIconColor;

    barBackgroundColor = (widget.barBackgroundColor == null)
        ? (Theme.of(context).brightness == Brightness.dark)
            ? Color(0xFF212121)
            : Colors.white
        : widget.barBackgroundColor;

    Color textColor = (widget.titleStyle.color == null)
        ? (Theme.of(context).brightness == Brightness.dark)
            ? Colors.white
            : Colors.black54
        : widget.titleStyle.color;

    themedTextStyle = widget.titleStyle.copyWith(color: textColor);

    inactiveIconColor = (widget.inactiveIconColor == null)
        ? (Theme.of(context).brightness == Brightness.dark)
            ? Colors.white
            : Theme.of(context).primaryColor
        : widget.inactiveIconColor;
    activeIconSize = widget.activeIconSize;
    inactiveIconSize = widget.inactiveIconSize;
    gradient = widget.gradient;
    shadowColor = widget.shadowColor != null
        ? widget.shadowColor
        : Theme.of(context).brightness == Brightness.dark
            ? Colors.white54
            : Colors.black12;

    super.didChangeDependencies();
  }

  @override
  void initState() {
    super.initState();
    _setSelected(widget.tabs[widget.initialSelection].key);

    // add listener for page swipes
    if (this.widget.pageController != null) {
      _pageControllerListener =
          () => this.setPageOffset(this.widget.pageController.page);
      this.widget.pageController.addListener(_pageControllerListener);
    }
  }

  _setSelected(UniqueKey key) {
    int selected = widget.tabs.indexWhere((tabData) => tabData.key == key);

    if (mounted) {
      setState(() {
        currentSelected = selected;
        _circleAlignX = -1 + (2 / (widget.tabs.length - 1) * selected);
        nextIcon = widget.tabs[selected].iconData;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      overflow: Overflow.visible,
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        Container(
          height: widget.barHeight,
          decoration: BoxDecoration(color: barBackgroundColor, boxShadow: [
            BoxShadow(
                color: shadowColor,
                offset: Offset(0, -1),
                blurRadius: widget.shadowBlur)
          ]),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: widget.tabs
                .map((t) => TabItem(
                    uniqueKey: t.key,
                    selected: t.key == widget.tabs[currentSelected].key,
                    iconData: t.iconData,
                    icon: t.icon,
                    title: t.title,
                    iconColor: inactiveIconColor,
                    iconSize: inactiveIconSize,
                    gradient: gradient,
                    animDuration: widget.animDuration,
                    titleStyle: themedTextStyle,
                    callbackFunction: (uniqueKey) {
                      int selected = widget.tabs
                          .indexWhere((tabData) => tabData.key == uniqueKey);
                      //widget.onTabChangedListener(selected);
                      //_setSelected(uniqueKey);
                      //_initAnimationAndStart(_circleAlignX, 1);
                      setPage(selected);
                    }))
                .toList(),
          ),
        ),
        Positioned.fill(
          top: -(widget.circleHeight +
                  widget.circleOutline +
                  widget.shadowAllowance) /
              2,
          child: Container(
            child: AnimatedAlign(
              duration: Duration(milliseconds: widget.animDuration),
              curve: Curves.easeOut,
              alignment: Alignment(_circleAlignX, 1),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 14),
                child: FractionallySizedBox(
                  widthFactor: 1 / widget.tabs.length,
                  child: GestureDetector(
                    onTap: widget.tabs[currentSelected].onclick,
                    child: Stack(
                      alignment: Alignment.center,
                      children: <Widget>[
                        SizedBox(
                          height: widget.circleHeight +
                              widget.circleOutline +
                              widget.shadowAllowance,
                          width: widget.circleHeight +
                              widget.circleOutline +
                              widget.shadowAllowance,
                          child: ClipRect(
                              clipper: HalfClipper(),
                              child: Container(
                                child: Center(
                                  child: Container(
                                      width: widget.circleHeight +
                                          widget.circleOutline,
                                      height: widget.circleHeight +
                                          widget.circleOutline,
                                      decoration: BoxDecoration(
                                          //color: Colors.white,
                                          shape: BoxShape.circle,
                                          boxShadow: [
                                            BoxShadow(
                                                color: shadowColor,
                                                blurRadius: 8)
                                          ])),
                                ),
                              )),
                        ),
                        SizedBox(
                            height: widget.arcHeight,
                            width: widget.arcWidth,
                            child: CustomPaint(
                              painter: HalfPainter(barBackgroundColor),
                            )),
                        SizedBox(
                          height: widget.circleHeight - 5,
                          width: widget.circleHeight - 5,
                          child: Container(
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                gradient: this.gradient,
                                color: circleColor),
                            child: Padding(
                              padding: const EdgeInsets.all(0.0),
                              child: AnimatedOpacity(
                                duration: Duration(
                                    milliseconds: widget.animDuration ~/ 5),
                                opacity: _circleIconAlpha,
                                child: activeIconWidget != null
                                    ? SizedBox(
                                        width: activeIconSize,
                                        height: activeIconSize,
                                        child: activeIconWidget)
                                    : Icon(
                                        activeIcon,
                                        color: activeIconColor,
                                        size: activeIconSize,
                                      ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  _initAnimationAndStart(double initialAlphaValue) {
    _circleIconAlpha = initialAlphaValue;

    Future.delayed(Duration(milliseconds: widget.animDuration ~/ 5), () {
      setState(() {
        activeIcon = nextIcon;
      });
    }).then((_) {
      Future.delayed(Duration(milliseconds: (widget.animDuration ~/ 5 * 3)),
          () {
        setState(() {
          _circleIconAlpha = 1;
        });
      });
    });
  }

  void setPage(int page) {
    //widget.onTabChangedListener(page);
    //_setSelected(widget.tabs[page].key);
    //_initAnimationAndStart(_circleAlignX, 1);
    if (widget.pageController != null) {
      widget.pageController.removeListener(_pageControllerListener);
      var f = widget.pageController.animateToPage(page,
          duration: Duration(milliseconds: kAnimDuration),
          curve: Curves.easeOut);

      f.then((v) {
        // be sure that listener is added only one time
        // ignore: INVALID_USE_OF_PROTECTED_MEMBER
        if (!widget.pageController.hasListeners) {
          widget.pageController.addListener(_pageControllerListener);
        }
      });
      _setSelected(widget.tabs[page].key);
      _initAnimationAndStart(0);
    } else {
      widget.onTabChangedListener(page);
      _setSelected(widget.tabs[page].key);
      _initAnimationAndStart(0);
      setState(() => currentSelected = page);
    }
  }

  void setPageOffset(double page) {
    print("$page");
    _setSelected(widget.tabs[page.round()].key);
    _initAnimationAndStart(1);
    setState(() {
      currentSelected = page.round();
    });
  }
}

class TabData {
  TabData({this.iconData, this.icon, @required this.title, this.onclick})
      : assert(iconData != null || icon != null);

  IconData iconData;
  Widget icon;
  String title;
  Function onclick;
  final UniqueKey key = UniqueKey();
}
