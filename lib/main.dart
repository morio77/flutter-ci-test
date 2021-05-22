import 'package:flutter/material.dart';
import 'package:flutter_ci_test/calc_model.dart';

import 'package:flutter_driver/flutter_driver.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Ci Test',
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
  var _counter = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CIでテストを自動化する'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('ボタンをタップで2倍になるよ', style: TextStyle(fontSize: 24),),
            Text('$_counter', style: TextStyle(fontSize: 50),),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final calc = Calculation();
          setState(() {
            _counter = calc.double(_counter);
          });
        },
        child: Icon(Icons.trending_up_outlined),
      ),
    );
  }
}
