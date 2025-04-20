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
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: Text(
            'Shop By Fabric',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 150,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: fabrics.length,
            itemBuilder: (context, index) {
              final fabric = fabrics[index];
              final color = Color(
                int.parse(
                  fabric.tintColor?.replaceFirst('#', '0xff') ?? '0xffffffff',
                ),
              );
              return Container(
                width: 120,
                margin: const EdgeInsets.symmetric(horizontal: 8.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: color,
                  image: DecorationImage(
                    image: NetworkImage(fabric.image ?? ''),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Center(
                  child: Text(
                    fabric.name ?? '',
                    style: const TextStyle(
                      fontSize: 16,
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
