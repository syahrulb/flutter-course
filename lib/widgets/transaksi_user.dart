import 'package:flutter/material.dart';

import './list_transaksi.dart';
import './tambah_transaksi.dart';
import '../models/transaction.dart';

class TransaksiUser extends StatefulWidget {
  @override
  _TransaksiUserState createState() => _TransaksiUserState();
}

class _TransaksiUserState extends State<TransaksiUser> {
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
  void tambahTransaksiBaru(String txJudul, double txJumlah) {
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

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TambahTransaksi(),
        ListTransaksi(_transaksiUsers),
      ],
    );
  }
}
