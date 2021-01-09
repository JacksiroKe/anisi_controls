import 'package:flutter/material.dart';
import 'package:anisi_controls/anisi_controls.dart';

class SecondPage extends StatefulWidget {
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  AsTextView textView = AsTextView.setUp("TextView that can state", 25, true);
  AsLineProgress lineProgress = AsLineProgress.setUp(63, Colors.black, Colors.blue[900], Colors.blue);
  AsInformer progress = AsInformer.setUp(1, "This is a Progress Informer widget", Colors.blue, Colors.white, Colors.transparent, 10);
  AsInformer success = AsInformer.setUp(2, "This is a Success Informer widget", Colors.green, Colors.white, Colors.transparent, 10);
  AsInformer failure = AsInformer.setUp(3, "This is a Failure Informer widget", Colors.red, Colors.white, Colors.transparent, 10);
  AsLoader loader = AsLoader.setUp(Colors.blue);
  
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => loadWidgets(context));
  }

  void loadWidgets(BuildContext context) {
    progress.showWidget();
    success.showWidget();
    failure.showWidget();
    loader.showWidget();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Widgets Example Demo"),),
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
              loader
            ],
          ),
        ),
      ),
    );
  }
}
