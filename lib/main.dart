import 'package:flutter/material.dart';

//bagian import wiget
import 'widgets/list_transaksi.dart';
import 'widgets/tambah_transaksi.dart';
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
  void _tambahTransaksiBaru(String txJudul, double txJumlah) {
    final dump = Transaksi(
      id: DateTime.now().toString(),
      judul: txJudul,
      jumlah: txJumlah,
      tanggal: DateTime.now(),
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
            Container(
              width: double.infinity,
              child: Card(
                color: Colors.blue,
                child: Text('Chart'),
                elevation: 5,
              ),
            ),
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
