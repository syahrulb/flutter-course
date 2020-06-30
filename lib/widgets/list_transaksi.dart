import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class ListTransaksi extends StatelessWidget {
  final List<Transaksi> transaksis;
  ListTransaksi(this.transaksis);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: transaksis.isEmpty
          ? Column(
              children: <Widget>[
                Text(
                  'tidak ada transaksi',
                  style: Theme.of(context).textTheme.title,
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 200,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                  elevation: 5,
                  margin: EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 5,
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: Padding(
                        padding: EdgeInsets.all(6),
                        child: FittedBox(
                          child: Text(
                              'Rp. ${transaksis[index].jumlah.toStringAsFixed(2)}'),
                        ),
                      ),
                    ),
                    title: Text(
                      transaksis[index].judul,
                      style: Theme.of(context).textTheme.title,
                    ),
                    subtitle: Text(
                      DateFormat.yMMMd().format(transaksis[index].tanggal),
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                );
              },
              itemCount: transaksis.length,
            ),
    );
    ;
  }
}
