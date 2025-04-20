import 'package:fashion_app/models/top_repository_model.dart'
    show MainStickyMenu;
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class TopSliderSection extends StatelessWidget {
  final List<MainStickyMenu> menuItems;

  const TopSliderSection({super.key, required this.menuItems});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (var menuItem in menuItems) ...[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Text(
              menuItem.title ?? '',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 10),
          CarouselSlider(
            options: CarouselOptions(
              height: 200.0,
              autoPlay: true,
              enlargeCenterPage: true,
              aspectRatio: 16 / 9,
              autoPlayCurve: Curves.fastOutSlowIn,
              enableInfiniteScroll: true,
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              viewportFraction: 0.8,
            ),
            items:
                menuItem.sliderImages?.map((sliderImage) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: NetworkImage(sliderImage.image ?? ''),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                sliderImage.title ?? '',
                                style: const TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                sliderImage.cta ?? '',
                                style: const TextStyle(
                                  fontSize: 14.0,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }).toList() ??
                [],
          ),
          const SizedBox(height: 20),
        ],
      ],
    );
  }
}
