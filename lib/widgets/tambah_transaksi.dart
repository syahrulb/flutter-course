import 'package:flutter/material.dart';

class TambahTransaksi extends StatelessWidget {
  final Function tambahTransaksi;
  final judulController = TextEditingController();
  final jumlahController = TextEditingController();
  TambahTransaksi(this.tambahTransaksi);

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
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Jumlah'),
              controller: jumlahController,
            ),
            FlatButton(
              onPressed: () {
                tambahTransaksi(
                  judulController.text,
                  double.parse(jumlahController.text),
                );
              },
              child: Text('Tambah Transaksi'),
              textColor: Colors.purple,
            )
          ],
        ),
      ),
    );
  }
}
