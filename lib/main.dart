import 'package:flutter/material.dart';

//bagian import wiget
import 'widgets/transaksi_user.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplikasi pencatatan pengeluaran.',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  // String inputJudul;
  // String inputJumlah;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pengcatatan pengeluaran'),
        backgroundColor: Colors.amber,
      ),
      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              width: double.infinity,
              child: Card(
                color: Colors.blue,
                child: Text('Chart'),
                elevation: 5,
              ),
            ),
            TransaksiUser(),
          ],
        ),
      ),
    );
  }
}
