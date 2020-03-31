import 'package:flutter/foundation.dart';

class Transaksi {
  final String id;
  final String judul;
  final double jumlah;
  final DateTime tanggal;

  Transaksi({
    @required this.id, 
    @required this.judul, 
    @required this.jumlah, 
    @required this.tanggal
    });
}
