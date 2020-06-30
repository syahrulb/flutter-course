import 'package:flutter/material.dart';

//bagian import widgets
import 'widgets/list_transaksi.dart';
import 'widgets/tambah_transaksi.dart';
import 'widgets/chart.dart';
// bagian models
import 'models/transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplikasi pencatatan pengeluaran.',
      home: MyHomePage(),
      theme: ThemeData(
        primarySwatch: Colors.red,
        accentColor: Colors.lightBlue,
        fontFamily: 'Quicksand',
        textTheme: ThemeData.light().textTheme.copyWith(
              title: TextStyle(
                fontFamily: 'OpenSans',
                fontWeight: FontWeight.bold,
                fontSize: 17,
              ),
              button: TextStyle(color: Colors.white),
            ),
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(
                title: TextStyle(
                  fontFamily: 'OpenSans',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaksi> _transaksiUsers = [
    Transaksi(
      id: '1',
      judul: 'Sepatu baru',
      jumlah: 69.98,
      tanggal: DateTime.now(),
    ),
    Transaksi(
      id: '2',
      judul: 'Steam Wallet',
      jumlah: 16.28,
      tanggal: DateTime.now(),
    ),
  ];
  List<Transaksi> get _transaksiSaatIni {
    return _transaksiUsers.where((transaksi) {
      return transaksi.tanggal.isAfter(
        DateTime.now().subtract(
          Duration(days: 7),
        ),
      );
    }).toList();
  }

  void _tambahTransaksiBaru(String txJudul, double txJumlah, DateTime tanggal) {
    final dump = Transaksi(
      id: DateTime.now().toString(),
      judul: txJudul,
      jumlah: txJumlah,
      tanggal: tanggal,
    );
    setState(() {
      _transaksiUsers.add(dump);
    });
  }

  void _modalTambahTransaksi(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return GestureDetector(
            onTap: () {},
            child: TambahTransaksi(_tambahTransaksiBaru),
            behavior: HitTestBehavior.opaque,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pencatatan pengeluaran'),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.add,
              color: Colors.white,
            ),
            onPressed: () => _modalTambahTransaksi(context),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Chart(_transaksiSaatIni),
            ListTransaksi(_transaksiUsers),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _modalTambahTransaksi(context),
      ),
    );
  }
}
