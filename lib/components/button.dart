import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String title;
  final void Function() onPress;
  final String color;

  const Button(
      {Key? key,
      required this.title,
      required this.onPress,
      required this.color})
      : super(key: key);

  getColor(context) {
    switch (color) {
      case "primary":
        return Theme.of(context).primaryColor;
      case "apple":
        return Colors.black;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: getColor(context),
          ),
          child: (Center(
            child: Padding(
              padding: const EdgeInsets.all(18),
              child: Text(
                title,
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
          ))),
    );
  }
}
