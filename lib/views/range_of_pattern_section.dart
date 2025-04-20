import 'package:fashion_app/models/bottom_repository_model.dart';
import 'package:flutter/material.dart';

class RangeOfPatternSection extends StatelessWidget {
  final List<RangeOfPattern> rangeOfPatterns;

  const RangeOfPatternSection({super.key, required this.rangeOfPatterns});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: Text(
            'Range of Pattern',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: rangeOfPatterns.length,
            itemBuilder: (context, index) {
              final pattern = rangeOfPatterns[index];
              return Container(
                width: 150,
                margin: const EdgeInsets.symmetric(horizontal: 8.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: NetworkImage(pattern.image ?? ''),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Center(
                  child: Text(
                    pattern.name ?? '',
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
