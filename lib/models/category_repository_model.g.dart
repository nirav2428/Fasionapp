// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_repository_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryRepositoryResponse _$CategoryRepositoryResponseFromJson(
  Map<String, dynamic> json,
) => CategoryRepositoryResponse(
  categories:
      (json['categories'] as List<dynamic>?)
          ?.map((e) => Category.fromJson(e as Map<String, dynamic>))
          .toList(),
  bannerImage: json['banner_image'] as String?,
  status: json['status'] as String?,
  message: json['message'] as String?,
);

Map<String, dynamic> _$CategoryRepositoryResponseToJson(
  CategoryRepositoryResponse instance,
) => <String, dynamic>{
  'categories': instance.categories,
  'banner_image': instance.bannerImage,
  'status': instance.status,
  'message': instance.message,
};

Category _$CategoryFromJson(Map<String, dynamic> json) => Category(
  categoryId: json['category_id'] as String?,
  categoryName: json['category_name'] as String?,
  parentId: json['parent_id'] as String?,
  child:
      (json['child'] as List<dynamic>?)
          ?.map((e) => ChildCategory.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$CategoryToJson(Category instance) => <String, dynamic>{
  'category_id': instance.categoryId,
  'category_name': instance.categoryName,
  'parent_id': instance.parentId,
  'child': instance.child,
};

ChildCategory _$ChildCategoryFromJson(Map<String, dynamic> json) =>
    ChildCategory(
      categoryId: json['category_id'] as String?,
      categoryName: json['category_name'] as String?,
      parentId: json['parent_id'] as String?,
    );

Map<String, dynamic> _$ChildCategoryToJson(ChildCategory instance) =>
    <String, dynamic>{
      'category_id': instance.categoryId,
      'category_name': instance.categoryName,
      'parent_id': instance.parentId,
    };
