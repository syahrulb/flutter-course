import 'package:flutter/material.dart';

class TambahTransaksi extends StatefulWidget {
  final Function tambahTransaksi;

  TambahTransaksi(this.tambahTransaksi);

  @override
  _TambahTransaksiState createState() => _TambahTransaksiState();
}

class _TambahTransaksiState extends State<TambahTransaksi> {
  final judulController = TextEditingController();

  final jumlahController = TextEditingController();

  void kirimData() {
    final enteredJudul = judulController.text;
    final enteredjumlah = double.parse(jumlahController.text);
    if (enteredJudul.isEmpty || enteredjumlah <= 0) {
      return;
    }
    widget.tambahTransaksi(
      enteredJudul,
      enteredjumlah,
    );
    //untuk menutup modal yang telah di tampilkan.
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Judul Pengeluaran'),
              controller: judulController,
              onSubmitted: (_) => kirimData(),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Jumlah pengeluaran'),
              controller: jumlahController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => kirimData(),
            ),
            FlatButton(
              onPressed: kirimData,
              child: Text('Tambah Pengeluaran'),
              textColor: Colors.purple,
            )
          ],
        ),
      ),
    );
  }
}
