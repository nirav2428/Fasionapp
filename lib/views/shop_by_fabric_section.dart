import 'package:fashion_app/models/middle_repository_model.dart';
import 'package:flutter/material.dart';

class ShopByFabricSection extends StatelessWidget {
  final List<ShopByFabric> fabrics;

  const ShopByFabricSection({super.key, required this.fabrics});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            'Shop By Fabric Material',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: 12),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 1 / 1, // To make them circular (square)
          ),
          itemCount: fabrics.length,
          itemBuilder: (context, index) {
            final fabric = fabrics[index];
            final color = Color(
              int.parse(
                fabric.tintColor?.replaceFirst('#', '0xff') ?? '0xffffffff',
              ),
            );
            return InkWell(
              onTap: () {
                // Handle fabric item tap
                print('Tapped on ${fabric.name}');
              },
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: color,
                      image:
                          fabric.image != null
                              ? DecorationImage(
                                image: NetworkImage(fabric.image!),
                                fit: BoxFit.cover,
                              )
                              : null,
                    ),
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 8, // Adjust spacing from the bottom as needed
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        fabric.name ?? '',
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
