// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_ci_test/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    // 最初は、「計算結果：0」と表示されていることを確認する
    expect(find.text('計算結果：0'), findsOneWidget);


    // 計算結果が偶数の時は「偶数」、奇数の時は「奇数」と表示されていることを確認する
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


    // FloatingActionボタンを押すと、計算結果が、0になることを確認する
    await tester.tap(find.byIcon(Icons.refresh));
    await tester.pump();
    expect(find.text('計算結果：0'), findsOneWidget);
  });
}
