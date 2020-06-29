import 'package:flutter/material.dart';

class TambahTransaksi extends StatelessWidget {
  final Function tambahTransaksi;
  final judulController = TextEditingController();
  final jumlahController = TextEditingController();
  TambahTransaksi(this.tambahTransaksi);

  void kirimData() {
    final enteredJudul = judulController.text;
    final enteredjumlah = double.parse(jumlahController.text);
    if (enteredJudul.isEmpty || enteredjumlah <= 0) {
      return;
    }
    tambahTransaksi(
      enteredJudul,
      enteredjumlah,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Judul'),
              controller: judulController,
              onSubmitted: (_) => kirimData(),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Jumlah'),
              controller: jumlahController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => kirimData(),
            ),
            FlatButton(
              onPressed: kirimData,
              child: Text('Tambah Pembelian'),
              textColor: Colors.purple,
            )
          ],
        ),
      ),
    );
  }
}
