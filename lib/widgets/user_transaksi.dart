import 'package:flutter/material.dart';
import './list_transaksi.dart';
import './tambah_transaksi.dart';
import '../models/transaksi.dart';

class UserTransaksi extends StatefulWidget {
  @override
  _UserTransaksiState createState() => _UserTransaksiState();
}

class _UserTransaksiState extends State<UserTransaksi> {
  final List<Transaksi> _userTransaksi = [
    Transaksi(
        id: '1', judul: 'bayar kost', jumlah: 865000, tanggal: DateTime.now(),),
    Transaksi(
      id: '2',
      judul: 'beli beli mouse',
      jumlah: 30000,
      tanggal: DateTime.now(),
    )
  ];
  void _tambahTransaksiBaru(String txJudul, double txJumlah) {
    final newTx = Transaksi(
        id: DateTime.now().toString(),
        judul: txJudul,
        jumlah: txJumlah,
        tanggal: DateTime.now());
    setState(() {
      _userTransaksi.add(newTx);
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TambahTransaksi(_tambahTransaksiBaru),
        TransaksiList(_userTransaksi),
      ],
    );
  }
}
