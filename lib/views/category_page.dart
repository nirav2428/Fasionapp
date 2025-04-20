import 'package:fashion_app/models/category_repository_model.dart';
import 'package:fashion_app/viewmodels/category_viewmodel.dart';
import 'package:fashion_app/views/category_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart'; // Import the correct package

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  void initState() {
    super.initState();
    Provider.of<CategoryViewModel>(
      context,
      listen: false,
    ).fetchCategoryData(); // Correct method name
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Categories')),
      body: Consumer<CategoryViewModel>(
        builder: (context, viewModel, child) {
          if (viewModel.isLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (viewModel.errorMessage != null) {
            return Center(child: Text('Error: ${viewModel.errorMessage!}'));
          } else if (viewModel.categoryRepositoryData?.categories != null) {
            final categories = viewModel.categoryRepositoryData!.categories!;
            final bannerImage = viewModel.categoryRepositoryData?.bannerImage;

            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: MasonryGridView.count(
                      // Using MasonryGridView as the alternative
                      crossAxisCount: 1,
                      itemCount: categories.length,
                      itemBuilder: (context, index) {
                        final category = categories[index];
                        return CategoryCard(
                          category: category,
                          image: bannerImage!,
                        );
                      },
                      mainAxisSpacing: 10.0,
                      crossAxisSpacing: 10.0,
                    ),
                  ),
                ],
              ),
            );
          } else {
            return const Center(child: Text('No categories available.'));
          }
        },
      ),
    );
  }
}
