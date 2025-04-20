import 'package:fashion_app/models/top_repository_model.dart';
import 'package:fashion_app/models/middle_repository_model.dart';
import 'package:fashion_app/models/bottom_repository_model.dart';
import 'package:fashion_app/services/api_service.dart';
import 'package:flutter/material.dart';

class HomeViewModel extends ChangeNotifier {
  final ApiService _apiService;

  HomeViewModel(this._apiService);

  TopRepositoryResponse? _topRepositoryData;
  TopRepositoryResponse? get topRepositoryData => _topRepositoryData;

  MiddleRepositoryResponse? _middleRepositoryData;
  MiddleRepositoryResponse? get middleRepositoryData => _middleRepositoryData;

  BottomRepositoryResponse? _bottomRepositoryData;
  BottomRepositoryResponse? get bottomRepositoryData => _bottomRepositoryData;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  Future<void> fetchHomePageData() async {
    _isLoading = true;
    notifyListeners();

    try {
      _topRepositoryData = await _apiService.getTopRepositoryData();
      _middleRepositoryData = await _apiService.getMiddleRepositoryData();
      _bottomRepositoryData = await _apiService.getBottomRepositoryData();
      _isLoading = false;
      notifyListeners();
    } catch (error) {
      _isLoading = false;
      _errorMessage = error.toString();
      notifyListeners();
    }
  }
}
