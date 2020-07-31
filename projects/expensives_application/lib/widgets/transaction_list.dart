import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../Models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function removeTransaction;

  TransactionList(
      {@required this.transactions, @required this.removeTransaction});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 450,
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
                  margin: EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 10,
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: FittedBox(
                            child: Text('\$${transactions[index].amount}')),
                      ),
                    ),
                    title: Text(
                      transactions[index].title,
                      style: Theme.of(context).textTheme.title,
                    ),
                    subtitle: Text(
                      DateFormat.yMMMMd().format(transactions[index].date),
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      color: Theme.of(context).errorColor,
                      onPressed: () {
                        removeTransaction(transactions[index].id);
                      },
                    ),
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
