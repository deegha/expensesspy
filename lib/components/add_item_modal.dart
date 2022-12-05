import 'package:expensesspy/models/category_model.dart';
import 'package:flutter/material.dart';
import 'package:expensesspy/services/transactions_service.dart';
import 'package:expensesspy/services/auth_service.dart';
import 'package:flutter/services.dart';

import '../models/transaction_model.dart';
import '../services/category_service.dart';
import 'category_tag.dart';

String catName = "";

class AddItemModal extends StatelessWidget {
  AddItemModal({Key? key}) : super(key: key);

  final tnx = TransactionsService();
  final txnModal =
      Txn(amount: "", description: "", category: "", userid: "", time: "");
  final auth = AuthService();

  final List<Category> categories = CategoryService.getCategories();

  final _descriptionController = TextEditingController();
  final _amountController = TextEditingController();

  handleOnTap(String name) {
    txnModal.setCategory(name);
  }

  handleCreateTransaction(context) {
    txnModal.setAmount(_amountController.text);
    txnModal.setDescription(_descriptionController.text);
    txnModal.setUserId(auth.getCurrentUser().uid);

    tnx.createTransaction(txnModal, () => Navigator.pop(context));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: (MediaQuery.of(context).size.height - 100),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Colors.grey[200]),
      child: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: FloatingActionButton(
                backgroundColor: Colors.blueGrey,
                onPressed: () => Navigator.pop(context),
                mini: true,
                child: const Icon(Icons.close),
              ),
            ),
            const SizedBox(
              height: 100,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // Description Text filed
                TextField(
                  controller: _descriptionController,
                  cursorColor: Theme.of(context).primaryColor,
                  decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Color.fromARGB(255, 80, 164, 179), width: 1.0),
                    ),
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Color.fromARGB(255, 80, 164, 179), width: 1.0),
                    ),
                    labelText: 'What did you spend on',
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),

                // Amount Text feild
                TextField(
                  controller: _amountController,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  cursorColor: Theme.of(context).primaryColor,
                  decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Color.fromARGB(255, 80, 164, 179), width: 1.0),
                    ),
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Color.fromARGB(255, 80, 164, 179), width: 1.0),
                    ),
                    labelText: 'Hou much did you spend',
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                // TextButton(
                //     onPressed: () {
                //       Future<TimeOfDay?> selectedTime24Hour = showTimePicker(
                //         context: context,
                //         initialTime: const TimeOfDay(hour: 10, minute: 47),
                //         builder: (BuildContext context, Widget? child) {
                //           return MediaQuery(
                //             data: MediaQuery.of(context)
                //                 .copyWith(alwaysUse24HourFormat: true),
                //             child: child!,
                //           );
                //         },
                //       );
                //     },
                //     child: const Text("Time")),
                const SizedBox(
                  height: 10,
                ),

                Text(
                  txnModal.category,
                  style: const TextStyle(color: Colors.amber),
                ),

                GridView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: categories.length,
                  itemBuilder: (context, index) => CategoryTag(
                      disabled:
                          txnModal.category == categories[index].categoryName,
                      callBack: handleOnTap,
                      catColor: categories[index].categoryColor,
                      categoryName: categories[index].categoryName),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    childAspectRatio: 2,
                  ),
                ),

                SizedBox(
                  width: 250,
                  child: FloatingActionButton.extended(
                    onPressed: () {
                      handleCreateTransaction(context);
                    },
                    label: const Text("Add Item"),
                    icon: const Icon(Icons.add),
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
