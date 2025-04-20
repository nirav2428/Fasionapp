import 'package:fashion_app/models/middle_repository_model.dart';
import 'package:fashion_app/viewmodels/category_viewmodel.dart';
import 'package:fashion_app/viewmodels/home_viewmodel.dart';
import 'package:fashion_app/views/boutique_collection_section.dart';
import 'package:fashion_app/views/category_page.dart';
import 'package:fashion_app/views/design_occasion_section.dart';
import 'package:fashion_app/views/range_of_pattern_section.dart';
import 'package:fashion_app/views/shop_by_category_section.dart';
import 'package:fashion_app/views/shop_by_fabric_section.dart';
import 'package:fashion_app/views/top_slider_section.dart';
import 'package:fashion_app/views/unstitched_section.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
    Provider.of<HomeViewModel>(context, listen: false).fetchHomePageData();
    // Fetch categories when the app loads
    Provider.of<CategoryViewModel>(context, listen: false).fetchCategoryData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fashion App'),
        bottom: TabBar(
          controller: _tabController,
          isScrollable: true,
          tabs: const [
            Tab(text: 'Home'),
            Tab(text: 'Category'),
            Tab(text: 'Wishlist'),
            Tab(text: 'Cart'),
            Tab(text: 'Profile'),
          ],
        ),
      ),
      body: Consumer<HomeViewModel>(
        builder: (context, viewModel, child) {
          if (viewModel.isLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (viewModel.errorMessage != null) {
            return Center(child: Text('Error: ${viewModel.errorMessage}'));
          } else if (viewModel.topRepositoryData != null &&
              viewModel.middleRepositoryData != null &&
              viewModel.bottomRepositoryData != null) {
            return TabBarView(
              controller: _tabController,
              children: [
                // Home Tab Content
                SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (viewModel.topRepositoryData?.mainStickyMenu != null)
                          TopSliderSection(
                            menuItems:
                                viewModel.topRepositoryData!.mainStickyMenu!,
                          ),
                        if (viewModel.middleRepositoryData?.shopByCategory !=
                            null)
                          ShopByCategorySection(
                            categories:
                                viewModel.middleRepositoryData!.shopByCategory!,
                          ),
                        if (viewModel.middleRepositoryData?.shopByFabric !=
                            null)
                          ShopByFabricSection(
                            fabrics:
                                viewModel.middleRepositoryData!.shopByFabric!,
                          ),
                        if (viewModel.middleRepositoryData?.unstitched != null)
                          UnstitchedSection(
                            unstitchedList:
                                viewModel.middleRepositoryData!.unstitched!,
                          ),
                        if (viewModel
                                .middleRepositoryData
                                ?.boutiqueCollection !=
                            null)
                          BoutiqueCollectionSection(
                            boutiqueCollections:
                                viewModel
                                    .middleRepositoryData!
                                    .boutiqueCollection!,
                          ),
                        if (viewModel.bottomRepositoryData?.rangeOfPattern !=
                            null)
                          RangeOfPatternSection(
                            rangeOfPatterns:
                                viewModel.bottomRepositoryData!.rangeOfPattern!,
                          ),
                        if (viewModel.bottomRepositoryData?.designOccasion !=
                            null)
                          DesignOccasionSection(
                            designOccasions:
                                viewModel.bottomRepositoryData!.designOccasion!,
                          ),
                      ],
                    ),
                  ),
                ),
                // Category Tab Content (Empty)
                const CategoryPage(),
                const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.category, size: 50),
                      Text('Category', style: TextStyle(fontSize: 20)),
                    ],
                  ),
                ),
                // Wishlist Tab Content (Empty)
                const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.favorite, size: 50),
                      Text('Wishlist', style: TextStyle(fontSize: 20)),
                    ],
                  ),
                ),
                // Cart Tab Content (Empty)
                const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.shopping_cart, size: 50),
                      Text('Cart', style: TextStyle(fontSize: 20)),
                    ],
                  ),
                ),
                // Profile Tab Content (Empty)
                const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.person, size: 50),
                      Text('Profile', style: TextStyle(fontSize: 20)),
                    ],
                  ),
                ),
              ],
            );
          } else {
            return const Center(child: Text('No data available.'));
          }
        },
      ),
    );
  }
}
