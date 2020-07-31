import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../Models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList({@required this.transactions});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 375,
      // Can also use singlechildscrollview
      child: transactions.isEmpty
          ? Column(
              children: <Widget>[
                Text(
                  "No transactions added yet...",
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
                )
              ],
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                  child: Row(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(5),
                        margin: EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 15,
                        ),
                        decoration: BoxDecoration(
                            border: Border.all(
                          color: Theme.of(context).primaryColor,
                          width: 2,
                        )),
                        child: Text(
                          '\$${transactions[index].amount.toStringAsFixed(2)}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            transactions[index].title,
                            style: Theme.of(context).textTheme.title,
                          ),
                          Text(
                            DateFormat.yMMMd().format(transactions[index].date),
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 15,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                );
              },
              itemCount: transactions.length,
              // This is an inefficient solution ============================================
              // children: transactions.map((tx) {
              //   return Card(
              //     child: Row(
              //       children: <Widget>[
              //         Container(
              //           padding: EdgeInsets.all(5),
              //           margin: EdgeInsets.symmetric(
              //             vertical: 10,
              //             horizontal: 15,
              //           ),
              //           decoration: BoxDecoration(
              //               border: Border.all(
              //             color: Colors.purple,
              //             width: 2,
              //           )),
              //           child: Text(
              //             '\$${tx.amount.toString()}',
              //             style: TextStyle(
              //               fontWeight: FontWeight.bold,
              //               fontSize: 20,
              //               color: Colors.purple,
              //             ),
              //           ),
              //         ),
              //         Column(
              //           crossAxisAlignment: CrossAxisAlignment.start,
              //           children: <Widget>[
              //             Text(
              //               tx.title,
              //               style: TextStyle(
              //                 fontSize: 22,
              //                 fontWeight: FontWeight.bold,
              //               ),
              //             ),
              //             Text(
              //               DateFormat.yMMMd().format(tx.date),
              //               style: TextStyle(
              //                 color: Colors.grey,
              //                 fontSize: 15,
              //               ),
              //             )
              //           ],
              //         )
              //       ],
              //     ),
              //   );
              // }).toList(),
            ),
    );
  }
}
