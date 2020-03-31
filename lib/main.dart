import 'package:flutter/material.dart';
import './widgets/user_transaksi.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simpan Pinjam',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {

  // String judulInput;
  // String jumlahInput;

  // digunakan sebagai menyimpan data secara langsung ketika keystroke di tekan.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Aplikasi Simpan pinjam'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            width: double.infinity,
            child: Card(
              color: Colors.blue,
              child: Text('Grafik'),
              elevation: 5,
            ),
          ),
          UserTransaksi()
        ],
      ),
    );
  }
}
