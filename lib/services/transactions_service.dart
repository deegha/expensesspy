import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expensesspy/models/transaction_model.dart';

class TransactionsService {
  final db = FirebaseFirestore.instance;

  static List<Txn> getRecentTransactions() {
    return [
      Txn(
          description: "Lunch with mike",
          amount: "342",
          userid: "dfs",
          time: "12.24pm",
          category: "Grosary"),
      Txn(
          description: "Tea and snaks",
          amount: "400",
          userid: "dfs",
          time: "12.24",
          category: "Grosary"),
      Txn(
          description: "Dinner with wife",
          amount: "123",
          userid: "dfs",
          time: "12.24",
          category: "Grosary"),
    ];
  }

  getSummary(String userId) async {
    final response = await db
        .collection("summary")
        .doc(userId)
        .get()
        .then((value) => value.data());

    return response;
  }

  void createTransaction(Txn txn, Function callBack) async {
    final db = FirebaseFirestore.instance;

    await db.collection("transactions").add({
      "amount": txn.amount,
      "description": txn.description,
      "category": txn.category,
      "userId": txn.userid
    });

    callBack();
  }
}
