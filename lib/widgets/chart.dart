import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class Chart extends StatelessWidget {
  final List<Transaksi> transaksiSaatIni;
  Chart(this.transaksiSaatIni);
  List<Map<String, Object>> get grouptransaksis {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      );
      double totalSum = 0.0;
      for (var i = 0; i < transaksiSaatIni.length; i++) {
        if (transaksiSaatIni[i].tanggal.day == weekDay.day &&
            transaksiSaatIni[i].tanggal.month == weekDay.month &&
            transaksiSaatIni[i].tanggal.year == weekDay.year) {
          totalSum += transaksiSaatIni[i].jumlah;
        }
      }
      return {'Hari': DateFormat.E().format(weekDay), 'jumlah': totalSum};
    });
  }

  @override
  Widget build(BuildContext context) {
    print(grouptransaksis);
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(2),
      child: Row(
        children: <Widget>[],
      ),
    );
  }
}
