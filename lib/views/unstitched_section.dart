import 'package:fashion_app/models/middle_repository_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class UnstitchedSection extends StatelessWidget {
  final List<Unstitched> unstitchedList;

  const UnstitchedSection({super.key, required this.unstitchedList});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: Text(
            'Unstitched',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: 10),
        MasonryGridView.builder(
          // Changed to MasonryGridView.builder
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemCount: unstitchedList.length,
          itemBuilder: (context, index) {
            final item = unstitchedList[index];
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                // You might need to adjust these factors based on your desired look
                height: index.isEven ? 150 : 120, // Example of varying heights
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: NetworkImage(item.image ?? ''),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.name ?? '',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
          mainAxisSpacing: 8.0,
          crossAxisSpacing: 8.0,
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
