import 'package:flutter/material.dart';
import 'package:fashion_app/models/category_repository_model.dart';

class CategoryCard extends StatelessWidget {
  final Category category;
  final String image;

  const CategoryCard({super.key, required this.category, required this.image});

  @override
  Widget build(BuildContext context) {
    final String categoryName = category.categoryName ?? 'No Name';

    return Card(
      margin: EdgeInsets.zero,
      shape: const RoundedRectangleBorder(),
      child: SizedBox(
        height: 100.0,
        child: Stack(
          children: [
            Row(
              children: [
                Expanded(
                  flex: 10,
                  child: ClipPath(
                    clipper:
                        CurvedRightEdgeClipper(), // ⬅️ Change to right-edge clipper
                    child: Container(color: _getBackgroundColor(categoryName)),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(image),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Expanded(
                    child: Center(
                      child: Text(
                        textAlign: TextAlign.left,
                        categoryName,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                  ),
                  if (category.child != null && category.child!.isNotEmpty)
                    const Icon(Icons.keyboard_arrow_down, color: Colors.grey),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color _getBackgroundColor(String categoryName) {
    switch (categoryName.toLowerCase()) {
      case 'festivals':
        return const Color(0xFFF2E5D1);
      case 'family functions':
        return const Color(0xFFB7CED7);
      case 'tours & outings':
        return const Color(0xFFE9DAC1);
      case 'other occasions':
        return const Color(0xFFD1C4E9);
      case 'upload your design':
        return const Color(0xFFE9DAC1);
      case 'fabric book':
        return const Color(0xFFC8E6C9);
      case 'sale':
        return const Color(0xFFF48FB1);
      default:
        return Colors.grey[200]!;
    }
  }
}

class CurvedRightEdgeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final double curveWidth = 40.0;
    Path path = Path();

    path.moveTo(0, 0);
    path.lineTo(size.width - curveWidth, 0);
    path.quadraticBezierTo(
      size.width,
      size.height / 2,
      size.width - curveWidth,
      size.height,
    );
    path.lineTo(0, size.height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
