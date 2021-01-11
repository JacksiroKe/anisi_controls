# Anisi Controls

## Getting Started

<img src="https://github.com/JacksiroKe/anisi_controls/blob/master/images/screenshot2.jpg" width="250px" />

Widgets Inside:
* AsTextView
* AsLineProgress
* AsInformer
* AsLoader

## Basic Usage

Adding the widgets
```dart
    AsTextView textView = AsTextView.setUp("TextView that can state", 25, true, Colors.blue, Colors.grey);
    AsLineProgress lineProgress = AsLineProgress.setUp(63, Colors.black, Colors.blue[900], Colors.blue);
    AsInformer progress = AsInformer.setUp(1, "This is a Progress Informer widget", Colors.blue, Colors.transparent, Colors.white, 10);
    AsInformer success = AsInformer.setUp(2, "This is a Success Informer widget", Colors.green, Colors.transparent, Colors.white, 10);
    AsInformer failure = AsInformer.setUp(3, "This is a Failure Informer widget", Colors.red, Colors.transparent, Colors.white, 10);
    AsLoader loader = AsLoader.setUp(Colors.blue);
  
```
