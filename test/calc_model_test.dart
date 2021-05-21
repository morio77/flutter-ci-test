import 'package:flutter_ci_test/calc_model.dart';
import 'package:test/test.dart';

void main() {
  test('.double() double parameter number', () {
    final calc = Calculation();

    // 0を2倍しても0なことを確認するテスト
    expect(calc.double(0), 0);

    // 1を2倍すると2になることを確認するテスト
    expect(calc.double(1), 2);
  });
}