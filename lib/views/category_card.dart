import 'package:fashion_app/models/category_repository_model.dart';
import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final Category category;

  const CategoryCard({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      child: InkWell(
        onTap: () {
          // Handle category tap if needed
          print('Tapped on ${category.categoryName}');
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                category.categoryName ?? 'No Name',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              if (category.child != null && category.child!.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    '${category.child!.length} Subcategories',
                    style: const TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
