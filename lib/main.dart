import 'package:flutter/material.dart';

void main() => MyApp();

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Dog App',
      home: Scaffold(
          appBar: AppBar(
            title: Text(' Arus Kas '),
          ),
          body: Column(
            children: <Widget>[
              Container(
                  width: double.infinity,
                  child: Card(
                    color: Colors.blue,
                    child: Text('chart!'),
                    elevation: 5,
                  )
              ),
              Card(
                child: Text('List Of Tx'),
              )
            ],
          )),
    );
  }
}
