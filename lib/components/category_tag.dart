import 'package:flutter/material.dart';

class CategoryTag extends StatelessWidget {
  final Color catColor;
  final String categoryName;
  final Function callBack;
  final bool disabled;

  const CategoryTag(
      {Key? key,
      required this.catColor,
      required this.categoryName,
      required this.callBack,
      required this.disabled})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(2.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          onSurface: Colors.red,
          onPrimary: Colors.cyan,
          primary: catColor,
          minimumSize: const Size(60, 36),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(50)),
          ),
        ),
        onPressed: disabled ? null : () => callBack(categoryName),
        child: Text(
          categoryName,
          style:
              const TextStyle(color: Colors.white, fontWeight: FontWeight.w900),
        ),
      ),
    );
  }
}
