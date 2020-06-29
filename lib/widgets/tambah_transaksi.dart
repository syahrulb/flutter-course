import 'package:flutter/material.dart';

class TambahTransaksi extends StatelessWidget {
  final judulController = TextEditingController();
  final jumlahController = TextEditingController();
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
                print(judulController.text);
                print(jumlahController.text);
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
