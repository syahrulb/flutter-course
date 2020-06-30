import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TambahTransaksi extends StatefulWidget {
  final Function tambahTransaksi;

  TambahTransaksi(this.tambahTransaksi);

  @override
  _TambahTransaksiState createState() => _TambahTransaksiState();
}

class _TambahTransaksiState extends State<TambahTransaksi> {
  final _judulController = TextEditingController();
  final _jumlahController = TextEditingController();
  DateTime _tanggal;

  void _kirimData() {
    final enteredJudul = _judulController.text;
    final enteredjumlah = double.parse(_jumlahController.text);
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

  void _prensentDateTimePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then((value) {
      if (value == null) {
        return;
      }
      setState(() {
        _tanggal = value;
      });
    });
  }

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
              decoration: InputDecoration(labelText: 'Judul Pengeluaran'),
              controller: _judulController,
              onSubmitted: (_) => _kirimData(),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Jumlah pengeluaran'),
              controller: _jumlahController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => _kirimData(),
            ),
            Container(
              height: 50,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      _tanggal == null
                          ? 'Tidak tanggal yang dipilih'
                          : DateFormat.yMd().format(_tanggal),
                    ),
                  ),
                  FlatButton(
                    textColor: Theme.of(context).primaryColor,
                    onPressed: _prensentDateTimePicker,
                    child: Text(
                      'Pilih tanggal',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              ),
            ),
            RaisedButton(
              onPressed: _kirimData,
              child: Text('Tambah Pengeluaran'),
              color: Theme.of(context).primaryColor,
              textColor: Theme.of(context).textTheme.button.color,
            )
          ],
        ),
      ),
    );
  }
}
