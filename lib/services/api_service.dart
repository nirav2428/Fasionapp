import 'package:fashion_app/models/category_repository_model.dart';
import 'package:fashion_app/models/top_repository_model.dart';
import 'package:fashion_app/models/middle_repository_model.dart';
import 'package:fashion_app/models/bottom_repository_model.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: "http://app-interview.easyglue.in/")
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @GET("/top_repository.json")
  Future<TopRepositoryResponse> getTopRepositoryData();

  @GET("/middle_repository.json")
  Future<MiddleRepositoryResponse> getMiddleRepositoryData();

  @GET("/bottom_repository.json")
  Future<BottomRepositoryResponse> getBottomRepositoryData();

  @GET("/category_repository.json")
  Future<CategoryRepositoryResponse> getCategoryRepositoryData();
}
