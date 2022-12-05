import 'package:flutter/material.dart';
import 'package:expensesspy/services/transactions_service.dart';
import 'package:expensesspy/services/auth_service.dart';

class Summary extends StatelessWidget {
  Summary({Key? key}) : super(key: key);
  final auth = AuthService();

  @override
  Widget build(BuildContext context) {
    final transactions = TransactionsService();
    return FutureBuilder(
      future: transactions.getSummary(auth.getCurrentUser().uid),
      builder: ((context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data = snapshot.data! as Map<String, dynamic>;

          return Row(
            children: [
              Text(
                "LKR",
                style: Theme.of(context).textTheme.headline2,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                data["thisMonth"].toString(),
                style: Theme.of(context).textTheme.headline2,
              )
            ],
          );
        }

        return Text(
          "Loading this month",
          style: Theme.of(context).textTheme.headline2,
        );
      }),
    );
  }
}
