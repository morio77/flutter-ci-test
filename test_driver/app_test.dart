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

    /// スクリーンショットを取る関数
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

    test('アプリについて画面へ遷移して戻ってくる', () async {
      final health = await driver.checkHealth();
      print(health.status);

      await driver.tap(find.byValueKey('toAppAbout')); // アプリについて画面に遷移する
      expect(await driver.getText(find.byValueKey('appVersion')), 'アプリバージョン：1.0.0');

      await _takeScreenShot('アプリについて画面');

      await driver.tap(find.byTooltip('Back')); // 元の画面に戻る
    });
  });
}