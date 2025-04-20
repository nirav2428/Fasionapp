import 'package:fashion_app/models/bottom_repository_model.dart';
import 'package:flutter/material.dart';

class DesignOccasionSection extends StatelessWidget {
  final List<DesignOccasion> designOccasions;

  const DesignOccasionSection({super.key, required this.designOccasions});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: Text(
            'Design Occasion',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: 10),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            childAspectRatio: 1.2,
          ),
          itemCount: designOccasions.length,
          itemBuilder: (context, index) {
            final occasion = designOccasions[index];
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: NetworkImage(occasion.image ?? ''),
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
                      occasion.name ?? '',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      occasion.subName ?? '',
                      style: const TextStyle(fontSize: 14, color: Colors.white),
                    ),
                    Text(
                      occasion.cta ?? '',
                      style: const TextStyle(fontSize: 14, color: Colors.white),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
