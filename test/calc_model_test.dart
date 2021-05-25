import 'package:flutter_ci_test/calc_model.dart';
import 'package:test/test.dart';

void main() {
  test('Calculation.add() test', () {
    // 0+0は0なことを確認する
    expect(Calculation.add(0, 0), 0);

    // 1+1は2なことを確認する
    expect(Calculation.add(1, 1), 2);

    // 負の数にも対応していることを確認する
    expect(Calculation.add(-4, 2), -2);
  });
}