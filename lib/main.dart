import 'package:flutter/material.dart';

void main() => runApp(MyApps());

class MyApps extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('my first apps'),
          backgroundColor: Colors.redAccent,
        ),
        body: Text('ini bagian body'),
      ),
    );
  }
}
