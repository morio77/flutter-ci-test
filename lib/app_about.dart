import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppAbout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('アプリについて'),
        centerTitle:  true,
      ),
      body: Center(
        child: Text(
          'アプリバージョン：1.0.0',
          style: TextStyle(fontSize: 24),
          key: Key('appVersion'),
        ),
      ),
    );
  }
}