import 'package:flutter/material.dart';

class RcentItem extends StatelessWidget {
  final String description;
  final String amount;
  final String date;
  final String currency;

  const RcentItem(
      {Key? key,
      required this.description,
      required this.amount,
      required this.date,
      required this.currency})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(description,
                  style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                      color: Colors.black)),
              Row(
                children: [
                  Text(currency,
                      style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.black)),
                  Text(amount,
                      style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.black)),
                ],
              )
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Text(date, style: Theme.of(context).textTheme.bodyText2)
        ],
      ),
    );
  }
}
