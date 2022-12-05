import 'package:flutter/material.dart';

import 'package:expensesspy/utils/clip_path.dart';
import 'package:expensesspy/components/recent_item.dart';
import 'package:expensesspy/components/summary.dart';
import 'package:expensesspy/components/add_item_modal.dart';
import 'package:expensesspy/screens/settings_page.dart';

import 'package:expensesspy/services/auth_service.dart';
import 'package:expensesspy/services/transactions_service.dart';
import 'package:expensesspy/models/transaction_model.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final auth = AuthService();
  final List<Txn> recentTxn = TransactionsService.getRecentTransactions();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ClipPath(
            clipper: CurveClipper(),
            child: Container(
              height: 350,
              decoration: BoxDecoration(
                color: Theme.of(context).backgroundColor,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Padding(
                  padding: const EdgeInsets.only(left: 40),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 50,
                      ),
                      Align(
                          alignment: Alignment.topRight,
                          child: FloatingActionButton(
                            heroTag: "btn1",
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const SettingsPage()),
                              );
                            },
                            backgroundColor: Theme.of(context).backgroundColor,
                            mini: true,
                            child: const Icon(Icons.settings),
                          )),
                      Text(
                        "This month spending",
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Summary(),
                      const SizedBox(
                        height: 40,
                      ),
                      const Text(
                        "today spending",
                        style: TextStyle(color: Colors.black, fontSize: 17),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: const [
                          Text(
                            "LKR",
                            style: TextStyle(color: Colors.black, fontSize: 30),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text("20,000",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 30))
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Text(
            "Show the latest 3 items added",
            style: Theme.of(context).textTheme.bodyText2,
            textAlign: TextAlign.start,
          ),
          const SizedBox(
            height: 30,
          ),
          SizedBox(
            child: Column(
              children: [
                ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: recentTxn.length,
                    itemBuilder: (BuildContext ctx, int index) {
                      return RcentItem(
                          currency: "LKR",
                          description: recentTxn[index].description,
                          amount: recentTxn[index].amount,
                          date: "12.30pm");
                    }),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextButton(
                  child: Text('Generate Statement',
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.normal,
                          color: Theme.of(context).primaryColor)),
                  onPressed: () {},
                ),
              ],
            ),
          ),
          FloatingActionButton.extended(
            heroTag: "btn2",
            onPressed: () {
              showModalBottomSheet<void>(
                context: context,
                isDismissible: true,
                isScrollControlled: true,
                builder: (BuildContext context) {
                  return AddItemModal();
                },
              );
            },
            label: const Text('Add Transaction'),
            icon: const Icon(Icons.add),
            backgroundColor: Theme.of(context).primaryColor,
          )
        ],
      ),
    );
  }
}
