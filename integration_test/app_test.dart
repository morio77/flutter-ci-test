import 'package:flutter/material.dart';
import 'package:flutter_ci_test/main.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('数字のボタンを押した時の挙動をテスト', (WidgetTester tester) async {
    // ウィジェットを立ち上げる
    await tester.pumpWidget(MyApp());

    /// 最初は、「計算結果：0」と表示されていることを確認する
    expect(find.text('計算結果：0'), findsOneWidget);


    /// 計算結果が偶数の時は「偶数」、奇数の時は「奇数」と表示されていることを確認する
    // (同時に各ボタンが動作することも確認する)
    await tester.tap(find.byKey(Key('1')));
    await tester.pump();
    expect(find.text('奇数'), findsOneWidget); // この時点で計算結果：1 なので奇数

    await tester.tap(find.byKey(Key('2')));
    await tester.pump();
    expect(find.text('奇数'), findsOneWidget); // この時点で計算結果：3 なので奇数

    await tester.tap(find.byKey(Key('3')));
    await tester.pump();
    expect(find.text('偶数'), findsOneWidget); // この時点で計算結果：6 なので偶数


    /// FloatingActionボタンを押すと、計算結果が、0になることを確認する
    await tester.tap(find.byIcon(Icons.refresh));
    await tester.pump();
    expect(find.text('計算結果：0'), findsOneWidget);
  });

  testWidgets('アプリについて画面に遷移して戻ってくる', (WidgetTester tester) async {
    // ウィジェットを立ち上げる
    await tester.pumpWidget(MyApp());

    /// アプリについて画面へ遷移するボタンをタップ
    await tester.tap(find.byIcon(Icons.settings));
    await tester.pump(Duration(seconds: 1));

    /// 表示されているアプリのバージョンが正しいか確認する
    expect(find.text('アプリバージョン：1.0.0'), findsOneWidget);

    /// Home画面に遷移する
    await tester.tap(find.byTooltip('Back'));
  });
}
