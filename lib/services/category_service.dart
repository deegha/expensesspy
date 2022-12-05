import 'package:flutter/material.dart';

import '../models/category_model.dart';

class CategoryService {
  static List<Category> getCategories() {
    return [
      Category(categoryColor: Colors.amber, categoryName: "Food"),
      Category(
          categoryColor: const Color.fromARGB(255, 21, 15, 82),
          categoryName: "Grosary"),
      Category(
          categoryColor: const Color.fromARGB(255, 46, 152, 184),
          categoryName: "Travel"),
      Category(
          categoryColor: const Color.fromARGB(255, 202, 96, 34),
          categoryName: "Fuel"),
      Category(
          categoryColor: const Color.fromARGB(255, 14, 6, 5),
          categoryName: "Enter.."),
      Category(
          categoryColor: const Color.fromARGB(255, 79, 41, 184),
          categoryName: "Other"),
    ];
  }
}
