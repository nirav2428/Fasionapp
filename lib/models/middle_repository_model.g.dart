// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'middle_repository_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MiddleRepositoryResponse _$MiddleRepositoryResponseFromJson(
  Map<String, dynamic> json,
) => MiddleRepositoryResponse(
  shopByCategory:
      (json['shop_by_category'] as List<dynamic>?)
          ?.map((e) => ShopByCategory.fromJson(e as Map<String, dynamic>))
          .toList(),
  shopByFabric:
      (json['shop_by_fabric'] as List<dynamic>?)
          ?.map((e) => ShopByFabric.fromJson(e as Map<String, dynamic>))
          .toList(),
  unstitched:
      (json['Unstitched'] as List<dynamic>?)
          ?.map((e) => Unstitched.fromJson(e as Map<String, dynamic>))
          .toList(),
  boutiqueCollection:
      (json['boutique_collection'] as List<dynamic>?)
          ?.map((e) => BoutiqueCollection.fromJson(e as Map<String, dynamic>))
          .toList(),
  status: json['status'] as String?,
  message: json['message'] as String?,
);

Map<String, dynamic> _$MiddleRepositoryResponseToJson(
  MiddleRepositoryResponse instance,
) => <String, dynamic>{
  'shop_by_category': instance.shopByCategory,
  'shop_by_fabric': instance.shopByFabric,
  'Unstitched': instance.unstitched,
  'boutique_collection': instance.boutiqueCollection,
  'status': instance.status,
  'message': instance.message,
};

ShopByCategory _$ShopByCategoryFromJson(Map<String, dynamic> json) =>
    ShopByCategory(
      categoryId: json['category_id'] as String?,
      name: json['name'] as String?,
      tintColor: json['tint_color'] as String?,
      image: json['image'] as String?,
      sortOrder: json['sort_order'] as String?,
    );

Map<String, dynamic> _$ShopByCategoryToJson(ShopByCategory instance) =>
    <String, dynamic>{
      'category_id': instance.categoryId,
      'name': instance.name,
      'tint_color': instance.tintColor,
      'image': instance.image,
      'sort_order': instance.sortOrder,
    };

ShopByFabric _$ShopByFabricFromJson(Map<String, dynamic> json) => ShopByFabric(
  fabricId: json['fabric_id'] as String?,
  name: json['name'] as String?,
  tintColor: json['tint_color'] as String?,
  image: json['image'] as String?,
  sortOrder: json['sort_order'] as String?,
);

Map<String, dynamic> _$ShopByFabricToJson(ShopByFabric instance) =>
    <String, dynamic>{
      'fabric_id': instance.fabricId,
      'name': instance.name,
      'tint_color': instance.tintColor,
      'image': instance.image,
      'sort_order': instance.sortOrder,
    };

Unstitched _$UnstitchedFromJson(Map<String, dynamic> json) => Unstitched(
  rangeId: json['range_id'] as String?,
  name: json['name'] as String?,
  description: json['description'] as String?,
  image: json['image'] as String?,
);

Map<String, dynamic> _$UnstitchedToJson(Unstitched instance) =>
    <String, dynamic>{
      'range_id': instance.rangeId,
      'name': instance.name,
      'description': instance.description,
      'image': instance.image,
    };

BoutiqueCollection _$BoutiqueCollectionFromJson(Map<String, dynamic> json) =>
    BoutiqueCollection(
      bannerImage: json['banner_image'] as String?,
      name: json['name'] as String?,
      cta: json['cta'] as String?,
      bannerId: json['banner_id'] as String?,
    );

Map<String, dynamic> _$BoutiqueCollectionToJson(BoutiqueCollection instance) =>
    <String, dynamic>{
      'banner_image': instance.bannerImage,
      'name': instance.name,
      'cta': instance.cta,
      'banner_id': instance.bannerId,
    };
