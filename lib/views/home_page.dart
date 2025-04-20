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

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  // Define your tab pages as widgets
  final List<Widget> _widgetOptions = <Widget>[
    const HomeTabContent(),
    const CategoryPage(),
    const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.favorite, size: 50),
          Text('Wishlist', style: TextStyle(fontSize: 20)),
        ],
      ),
    ),
    const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.shopping_cart, size: 50),
          Text('Cart', style: TextStyle(fontSize: 20)),
        ],
      ),
    ),
    const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.person, size: 50),
          Text('Profile', style: TextStyle(fontSize: 20)),
        ],
      ),
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    Provider.of<HomeViewModel>(context, listen: false).fetchHomePageData();
    // Fetch categories when the app loads
    Provider.of<CategoryViewModel>(context, listen: false).fetchCategoryData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Fashion App')),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'HOME'),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'CATEGORY',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label: 'WISHLIST',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag_outlined),
            label: 'CART',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'PROFILE',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.green[800],
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed, // To show all labels
      ),
    );
  }
}

class HomeTabContent extends StatelessWidget {
  const HomeTabContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeViewModel>(
      builder: (context, viewModel, child) {
        if (viewModel.isLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (viewModel.errorMessage != null) {
          return Center(child: Text('Error: ${viewModel.errorMessage}'));
        } else if (viewModel.topRepositoryData != null &&
            viewModel.middleRepositoryData != null &&
            viewModel.bottomRepositoryData != null) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (viewModel.topRepositoryData?.mainStickyMenu != null)
                    TopSliderSection(
                      menuItems: viewModel.topRepositoryData!.mainStickyMenu!,
                    ),
                  if (viewModel.middleRepositoryData?.shopByCategory != null)
                    ShopByCategorySection(
                      categories:
                          viewModel.middleRepositoryData!.shopByCategory!,
                    ),
                  if (viewModel.middleRepositoryData?.shopByFabric != null)
                    ShopByFabricSection(
                      fabrics: viewModel.middleRepositoryData!.shopByFabric!,
                    ),
                  if (viewModel.middleRepositoryData?.unstitched != null)
                    UnstitchedSection(
                      unstitchedList:
                          viewModel.middleRepositoryData!.unstitched!,
                    ),
                  if (viewModel.middleRepositoryData?.boutiqueCollection !=
                      null)
                    BoutiqueCollectionSection(
                      boutiqueCollections:
                          viewModel.middleRepositoryData!.boutiqueCollection!,
                    ),
                  if (viewModel.bottomRepositoryData?.rangeOfPattern != null)
                    RangeOfPatternSection(
                      rangeOfPatterns:
                          viewModel.bottomRepositoryData!.rangeOfPattern!,
                    ),
                  if (viewModel.bottomRepositoryData?.designOccasion != null)
                    DesignOccasionSection(
                      designOccasions:
                          viewModel.bottomRepositoryData!.designOccasion!,
                    ),
                ],
              ),
            ),
          );
        } else {
          return const Center(child: Text('No data available.'));
        }
      },
    );
  }
}
