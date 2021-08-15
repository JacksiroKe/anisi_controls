import 'package:anisi_controls/anisi_controls.dart';
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
  AsTextView textView = AsTextView.setUp("TextView that can state", 25, true, Colors.blue, Colors.grey);
  AsLineProgress lineProgress = AsLineProgress.setUp(63, Colors.black, Colors.blue[900], Colors.blue);
  AsInformer progress = AsInformer.setUp(1, "This is a Progress Informer widget", Colors.blue, Colors.transparent, Colors.white, 10);
  AsInformer success = AsInformer.setUp(2, "This is a Success Informer widget", Colors.green, Colors.transparent, Colors.white, 10);
  AsInformer failure = AsInformer.setUp(3, "This is a Failure Informer widget", Colors.red, Colors.transparent, Colors.white, 10);
  AsLoader loader = AsLoader.setUp(Colors.blue);
  
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => loadWidgets(context));
  }

  void loadWidgets(BuildContext context) {
    progress.show();
    success.show();
    failure.show();
    loader.show();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Anisi Controls Demo"),),
      body: Center(
        child: Container(
          constraints: BoxConstraints.expand(),
          child: new Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(5),
                child: Center(child: textView),
              ),
              progress,
              success,
              failure,
              Padding(
                padding: const EdgeInsets.all(5),
                child: lineProgress,
              ),
              loader,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: FloatingActionButton.extended(
                  heroTag: "reload",
                  icon: Icon(Icons.refresh, color: Colors.white),
                  label: Text("Reload", style: TextStyle(color: Colors.white)),
                  onPressed: () {
                    refreshView();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void refreshView()
  {
    textView.setText("View Refreshed!");
    failure.modify(1, "Informer changed", Colors.green, Colors.transparent, Colors.white, 10);
  }
}
