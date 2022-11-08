import 'package:flutter/material.dart';
import '../models/transaction.dart';

class ExpenseAnalysis extends StatelessWidget {
  final List<Transaction> weekTransactions;
  final List<Transaction> allTransactions;
  ExpenseAnalysis(
    this.weekTransactions,
    this.allTransactions,
  );

  double weekTotalSpendings() {
    double totalSpent = 0.0;
    for (var i = 0; i < weekTransactions.length; i++) {
      totalSpent += weekTransactions[i].amount;
    }
    return totalSpent;
  }

  double totalSpendings() {
    double totalSpent = 0.0;
    for (var i = 0; i < allTransactions.length; i++) {
      totalSpent += allTransactions[i].amount;
    }
    return totalSpent;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Personal Expenses'),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                child: Text(
                  'Your Total Weekly Expenditure is: \$${weekTotalSpendings().toStringAsFixed(2)}',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                child: Text(
                  'Your Total Exoenditure is: \$${totalSpendings().toStringAsFixed(2)}',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              )
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: Text(
          'Go Back',
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
    );
  }
}
