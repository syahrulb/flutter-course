import 'package:flutter/material.dart';

class TambahTransaksi extends StatelessWidget {
  final judulController = TextEditingController();
  final jumlahController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'judul'),
              controller: judulController,
              // onChanged: (val) {
              //   judulInput = val;
              // },
            ),
            TextField(
              decoration: InputDecoration(labelText: 'jumlah'),
              controller: jumlahController,
              // onChanged: (val)=> jumlahInput = val,
            ),
            FlatButton(
              child: Text('tambah data'),
              textColor: Colors.purple,
              onPressed: () {
                print(judulController.text);
                print(jumlahController.text);
              },
            ),
          ],
        ),
      ),
    );
  }
}
