import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:anisi_controls/anisi_controls.dart';

void main() {
  const MethodChannel channel = MethodChannel('anisi_controls');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    //expect(await AnisiControls.platformVersion, '42');
  });
}
