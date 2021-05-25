import 'package:flutter/material.dart';
import 'package:flutter_ci_test/app_about.dart';
import 'package:flutter_ci_test/calc_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter ci Test',
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
  var calcResult = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CIでテストを自動化する'),
        centerTitle: true,
        actions: [
          IconButton(
            key: Key('toAppAbout'),
            onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) {return AppAbout();})),
            icon: Icon(Icons.settings),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text('計算結果：$calcResult', style: TextStyle(fontSize: 40),),
            Text(calcResult % 2 == 0 ? '偶数' : '奇数', style: TextStyle(fontSize: 30),),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _numberButton(1),
                _numberButton(2),
                _numberButton(3),
              ],
            ),
            Container( // 高さ調整用に暫定的に入れている
              height: 300,
              child: null,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            calcResult = 0;
          });
        },
        child: Icon(Icons.refresh),
      ),
    );
  }

  Widget _numberButton(int number) {
    return InkWell(
      hoverColor: Colors.orangeAccent,
      key: Key(number.toString()),
      onTap: () {
        setState(() {
          calcResult = Calculation.add(calcResult, number);
        });
      },
      child: Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          border: Border.all(),
        ),
        child: Center(child: Text(number.toString(), style: TextStyle(fontSize: 50),)),
      ),
    );
  }
}
