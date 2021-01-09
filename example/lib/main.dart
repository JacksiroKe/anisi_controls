import 'package:anisi_controls_example/second_page.dart';
import 'package:anisi_controls/as_bottom_navigation.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Anisi Controls Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentPage = 0;

  GlobalKey bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Anisi Controls Demo"),
      ),
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: BoxDecoration(color: Colors.white),
        child: Center(
          child: _getPage(currentPage),
        ),
      ),
      bottomNavigationBar: AsBottomNavigation(
        barHeight: 85,
        arcHeight: 50,
        arcWidth: 75,
        circleHeight: 50,
        initialSelection: 1,
        tabs: [
          TabData(iconData: Icons.home,
          title: "Home",
          onclick: () {
            final AsBottomNavigationState fState = bottomNavigationKey.currentState;
            fState.setPage(2);
          }),
          TabData(iconData: Icons.search, title: "Search", onclick: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => SecondPage()))),
          TabData(iconData: Icons.shopping_cart, title: "Shop")
        ],
        key: bottomNavigationKey,
        onTabChangedListener: (position) {
          setState(() {
            currentPage = position;
          });
        },
      ),
      drawer: myDrawer(),
    );

  }

  Widget myDrawer() {
    return Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text('Anisi Demo v0.0.1'),
              accountEmail: Text("Simplicity at its best"),
              currentAccountPicture: CircleAvatar(
                child: FlutterLogo(
                  size: 100,
                  style: FlutterLogoStyle.horizontal,
                ),
                backgroundColor: Colors.white,
              ),            
            ),
            ListTile(
              leading: Icon(Icons.card_membership),
              title: Text('Support us'),
            ),
            Divider(),
            ListTile( 
              leading: Icon(Icons.settings),
              title: Text('Settings'), 
            ),
            Divider(),
            ListTile( 
              leading: Icon(Icons.update),
              title: Text('Check Updates') 
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.help_center),
              title: Text('Help & Feedback'),
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.info),
              title: Text('About Anisi Controls'),
            ),
            Divider(),
          ],
        ),
      );
  }

  _getPage(int page) {
    switch (page) {
      case 0:
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text("This is the home page"),
            RaisedButton(
              child: Text(
                "Widgets Example Demo",
                style: TextStyle(color: Colors.white),
              ),
              color: Theme.of(context).primaryColor,
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => SecondPage()));
              },
            ),
            RaisedButton(
              child: Text(
                "Change to page 3",
                style: TextStyle(color: Colors.white),
              ),
              color: Theme.of(context).accentColor,
              onPressed: () {
                final AsBottomNavigationState fState =
                    bottomNavigationKey.currentState;
                fState.setPage(2);
              },
            )
          ],
        );
      case 1:
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text("This is the search page"),
            RaisedButton(
              child: Text(
                "Start new page",
                style: TextStyle(color: Colors.white),
              ),
              color: Theme.of(context).primaryColor,
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => SecondPage()));
              },
            )
          ],
        );
      default:
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text("This is the basket page"),
            RaisedButton(
              child: Text(
                "Start new page",
                style: TextStyle(color: Colors.white),
              ),
              color: Theme.of(context).primaryColor,
              onPressed: () {},
            )
          ],
        );
    }
  }
}
