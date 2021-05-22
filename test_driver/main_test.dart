import 'dart:io';

import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('Driver Test', () {
    FlutterDriver driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      if (driver != null) {
        await driver.close();
      }
    });

    Future<void> _takeScreenShot(String filename) async {
      await driver.waitUntilNoTransientCallbacks();
      final pixels = await driver.screenshot();

      final file = File('./test_driver/screenshots/$filename.png');
      await file.writeAsBytes(pixels);
      print('wrote $file');
    }

    test('起動直後の画面', () async {
      final health = await driver.checkHealth();
      print(health.status);

      await _takeScreenShot('起動直後の画面');
    });
  });
}