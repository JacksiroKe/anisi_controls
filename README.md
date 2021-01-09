# Anisi Controls

## Getting Started

```yaml
dependencies:
  ...
  anisi_controls: ^0.0.4
```
<table>
<tr>
<td><img src="https://github.com/JacksiroKe/anisi_controls/blob/master/images/Screenshot1.jpg" width="250px" /></td>
<td><img src="https://github.com/JacksiroKe/anisi_controls/blob/master/images/Screenshot2.jpg" width="250px" /></td>
</tr>
</table>

# AsBottomNavigation

## Basic Usage

Adding the widget
```dart
bottomNavigationBar: AsBottomNavigation(
    barHeight: 55,
    arcHeight: 50,
    arcWidth: 75,
    circleHeight: 50,
    initialSelection: 1,
    tabs: [
        TabData(iconData: Icons.home, title: "Home"),
        TabData(iconData: Icons.search, title: "Search"),
        TabData(iconData: Icons.shopping_cart, title: "Cart")
    ],
    onTabChangedListener: (position) {
        setState(() {
        _currentIndex = position;
        });
    },
    ),
```

## TabData
**iconData** -> Icon to be used for the tab<br/>
**title** -> String to be used for the tab<br/>
**onClick** -> Optional function to be used when the circle itself is clicked, on an active tab

## Attributes
### required
**tabs** -> List of `TabData` objects<br/>
**onTabChangedListener** -> Function to handle a tap on a tab, receives `int position`

### optional
**initialSelection** -> Defaults to 0<br/>
**circleColor** -> Defaults to null, derives from `Theme`<br/>
**activeIconColor** -> Defaults to null, derives from `Theme`<br/>
**inactiveIconColor** -> Defaults to null, derives from `Theme`<br/>
**taxtColor** -> Defaults to null, derives from `Theme`<br/>
**barBackgroundColor** -> Defaults to null, derives from `Theme`<br/>
**key** -> Defaults to null<br/>

## Theming

The bar will attempt to use your current theme out of the box, however you may want to theme it. Here are the attributes:


## Programmatic Selection

To select a tab programmatically you will need to assign a GlobalKey to the widget. When you want to change tabs you will need to access the State using this key, and then call `setPage(position)`.<br/>
See example project, main.dart, line 75 for an example.

## Showcase
Using this package in a live app, let me know and I'll add you app here.


## Inspiration

This package was inspired by a design on dribbble by Manoj Rajput:<br/>
https://dribbble.com/shots/5419022-Tab

## Contributing

Contributions are welcome, please submit a PR :)