import 'package:json_annotation/json_annotation.dart';

part 'category_repository_model.g.dart';

@JsonSerializable()
class CategoryRepositoryResponse {
  List<Category>? categories;
  @JsonKey(name: 'banner_image')
  String? bannerImage;
  String? status;
  String? message;

  CategoryRepositoryResponse({
    this.categories,
    this.bannerImage,
    this.status,
    this.message,
  });

  factory CategoryRepositoryResponse.fromJson(Map<String, dynamic> json) =>
      _$CategoryRepositoryResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryRepositoryResponseToJson(this);
}

@JsonSerializable()
class Category {
  @JsonKey(name: 'category_id')
  String? categoryId;
  @JsonKey(name: 'category_name')
  String? categoryName;
  @JsonKey(name: 'parent_id')
  String? parentId;
  List<ChildCategory>? child;

  Category({this.categoryId, this.categoryName, this.parentId, this.child});

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryToJson(this);
}

@JsonSerializable()
class ChildCategory {
  @JsonKey(name: 'category_id')
  String? categoryId;
  @JsonKey(name: 'category_name')
  String? categoryName;
  @JsonKey(name: 'parent_id')
  String? parentId;

  ChildCategory({this.categoryId, this.categoryName, this.parentId});

  factory ChildCategory.fromJson(Map<String, dynamic> json) =>
      _$ChildCategoryFromJson(json);

  Map<String, dynamic> toJson() => _$ChildCategoryToJson(this);
}
