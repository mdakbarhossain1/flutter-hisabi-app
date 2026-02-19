import 'package:flutter/material.dart';

class CategoryWidget extends StatelessWidget {
  final String categoryTitle;
  final Color categoryColor;

  const CategoryWidget({
    super.key,
    required this.categoryTitle,
    required this.categoryColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      width: 100,
      child: Card(
        color: categoryColor,
        margin: EdgeInsets.zero,
        elevation: 0,
        child: Center(
          child: Text(
            categoryTitle,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}
