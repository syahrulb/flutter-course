import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';
import './chart_bar.dart';

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
      return {
        'hari': DateFormat.E().format(weekDay).substring(0, 1),
        'jumlah': totalSum,
      };
    });
  }

  double get totalPengeluaran {
    return grouptransaksis.fold(0.0, (sum, item) {
      return sum + item['jumlah'];
    });
  }

  @override
  Widget build(BuildContext context) {
    print(grouptransaksis);
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(2),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: grouptransaksis.map(
            (data) {
              return Flexible(
                fit: FlexFit.loose,
                child: ChartBar(
                  data['hari'],
                  data['jumlah'],
                  totalPengeluaran == 0.0
                      ? 0.0
                      : (data['jumlah'] as double) / totalPengeluaran,
                ),
              );
            },
          ).toList()),
    );
  }
}
