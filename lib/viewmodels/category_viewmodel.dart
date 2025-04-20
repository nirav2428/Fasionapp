import 'package:fashion_app/models/category_repository_model.dart'; // Import your new category model
import 'package:fashion_app/services/api_service.dart';
import 'package:flutter/material.dart';

class CategoryViewModel extends ChangeNotifier {
  final ApiService _apiService;

  CategoryViewModel(this._apiService);

  CategoryRepositoryResponse? _categoryRepositoryData;
  CategoryRepositoryResponse? get categoryRepositoryData =>
      _categoryRepositoryData;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  Future<void> fetchCategoryData() async {
    _isLoading = true;
    notifyListeners();

    try {
      _categoryRepositoryData = await _apiService.getCategoryRepositoryData();
      _isLoading = false;
      notifyListeners();
    } catch (error) {
      _isLoading = false;
      _errorMessage = error.toString();
      notifyListeners();
    }
  }
}
