import 'package:carousel_slider/carousel_slider.dart';
import 'package:fashion_app/models/top_repository_model.dart'
    show MainStickyMenu, SliderImage;
import 'package:flutter/material.dart';

class TopSliderSection extends StatefulWidget {
  final List<MainStickyMenu> menuItems;

  const TopSliderSection({super.key, required this.menuItems});

  @override
  State<TopSliderSection> createState() => _TopSliderSectionState();
}

class _TopSliderSectionState extends State<TopSliderSection> {
  int _selectedMenuIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 100,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            itemCount: widget.menuItems.length,
            separatorBuilder: (context, index) => const SizedBox(width: 16.0),
            itemBuilder: (context, index) {
              final menuItem = widget.menuItems[index];
              final isSelected = _selectedMenuIndex == index;
              return SizedBox(
                // Wrap the InkWell with SizedBox for consistent item height
                width: 80.0, // Adjust this width as needed for your menu items
                child: InkWell(
                  onTap: () {
                    setState(() {
                      _selectedMenuIndex = index;
                    });
                    print('Tapped on ${menuItem.title}');
                  },
                  child: Card(
                    clipBehavior: Clip.antiAlias,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment
                              .center, // Center items horizontally
                      children: [
                        SizedBox(
                          height: 50.0, // Adjust image height
                          width: double.infinity, // Take full width of the Card
                          child: Stack(
                            children: [
                              Positioned.fill(
                                child: Image.network(
                                  menuItem.image ?? '',
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) {
                                    return const Center(
                                      child: Icon(Icons.image_not_supported),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            menuItem.title ?? '',
                            textAlign: TextAlign.center, // Center the text
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 10.0,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 16),
        if (widget.menuItems.isNotEmpty &&
            widget.menuItems[_selectedMenuIndex].sliderImages != null)
          _buildCarouselSlider(
            widget.menuItems[_selectedMenuIndex].sliderImages!,
          ),
      ],
    );
  }

  Widget _buildCarouselSlider(List<SliderImage> sliderImages) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 220.0, // Adjust height to accommodate text overlay
        autoPlay: true,
        enlargeCenterPage: true,
        aspectRatio: 16 / 9,
        autoPlayCurve: Curves.fastOutSlowIn,
        enableInfiniteScroll: true,
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        viewportFraction: 0.9, // Make images take up more width
      ),
      items:
          sliderImages.map((sliderImage) {
            return Builder(
              builder: (BuildContext context) {
                return Stack(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: NetworkImage(sliderImage.image ?? ''),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 16.0, // Adjust bottom spacing for the text box
                      left: 16.0,
                      child: Container(
                        padding: const EdgeInsets.all(12.0),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(
                            0.8,
                          ), // Semi-transparent white background
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              sliderImage.title ?? '',
                              style: const TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                            const SizedBox(height: 4.0),
                            Text(
                              sliderImage.cta ?? '',
                              style: const TextStyle(
                                fontSize: 14.0,
                                color: Colors.black54,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
            );
          }).toList(),
    );
  }
}
