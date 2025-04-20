import 'package:fashion_app/models/middle_repository_model.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class BoutiqueCollectionSection extends StatefulWidget {
  final List<BoutiqueCollection> boutiqueCollections;

  const BoutiqueCollectionSection({
    super.key,
    required this.boutiqueCollections,
  });

  @override
  State<BoutiqueCollectionSection> createState() =>
      _BoutiqueCollectionSliderSectionState();
}

class _BoutiqueCollectionSliderSectionState
    extends State<BoutiqueCollectionSection> {
  int _currentSlide = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            'Boutique Collection',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: 12),
        CarouselSlider.builder(
          itemCount: widget.boutiqueCollections.length,
          options: CarouselOptions(
            height: 280.0, // Adjust height to accommodate text
            autoPlay: true,
            enlargeCenterPage: true,
            viewportFraction: 0.9,
            aspectRatio: 16 / 9,
            initialPage: 0,
            onPageChanged: (index, reason) {
              setState(() {
                _currentSlide = index;
              });
            },
          ),
          itemBuilder: (BuildContext context, int index, int realIndex) {
            final collection = widget.boutiqueCollections[index];
            return Stack(
              children: [
                Positioned.fill(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(0.0),
                    child: Image.network(
                      collection.bannerImage ?? '',
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return const Center(
                          child: Icon(Icons.image_not_supported),
                        );
                      },
                    ),
                  ),
                ),
                Positioned(
                  left: 16.0,
                  bottom: 16.0,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12.0,
                      vertical: 8.0,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          collection.name ?? '',
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4.0),
                        Text(
                          collection.cta ?? '+ EXPLORE',
                          style: const TextStyle(
                            color: Colors.black54,
                            fontSize: 14.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children:
              widget.boutiqueCollections.asMap().entries.map((entry) {
                return Container(
                  width: 8.0,
                  height: 8.0,
                  margin: const EdgeInsets.symmetric(horizontal: 4.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color:
                        _currentSlide == entry.key
                            ? Colors.black87
                            : Colors.grey[300],
                  ),
                );
              }).toList(),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
