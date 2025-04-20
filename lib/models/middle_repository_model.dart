import 'package:json_annotation/json_annotation.dart';

part 'middle_repository_model.g.dart';

@JsonSerializable()
class MiddleRepositoryResponse {
  @JsonKey(name: 'shop_by_category')
  List<ShopByCategory>? shopByCategory;
  @JsonKey(name: 'shop_by_fabric')
  List<ShopByFabric>? shopByFabric;
  @JsonKey(name: 'Unstitched')
  List<Unstitched>? unstitched;
  @JsonKey(name: 'boutique_collection')
  List<BoutiqueCollection>? boutiqueCollection;
  String? status;
  String? message;

  MiddleRepositoryResponse({
    this.shopByCategory,
    this.shopByFabric,
    this.unstitched,
    this.boutiqueCollection,
    this.status,
    this.message,
  });

  factory MiddleRepositoryResponse.fromJson(Map<String, dynamic> json) =>
      _$MiddleRepositoryResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MiddleRepositoryResponseToJson(this);
}

@JsonSerializable()
class ShopByCategory {
  @JsonKey(name: 'category_id')
  String? categoryId;
  String? name;
  @JsonKey(name: 'tint_color')
  String? tintColor;
  String? image;
  @JsonKey(name: 'sort_order')
  String? sortOrder;

  ShopByCategory({
    this.categoryId,
    this.name,
    this.tintColor,
    this.image,
    this.sortOrder,
  });

  factory ShopByCategory.fromJson(Map<String, dynamic> json) =>
      _$ShopByCategoryFromJson(json);

  Map<String, dynamic> toJson() => _$ShopByCategoryToJson(this);
}

@JsonSerializable()
class ShopByFabric {
  @JsonKey(name: 'fabric_id')
  String? fabricId;
  String? name;
  @JsonKey(name: 'tint_color')
  String? tintColor;
  String? image;
  @JsonKey(name: 'sort_order')
  String? sortOrder;

  ShopByFabric({
    this.fabricId,
    this.name,
    this.tintColor,
    this.image,
    this.sortOrder,
  });

  factory ShopByFabric.fromJson(Map<String, dynamic> json) =>
      _$ShopByFabricFromJson(json);

  Map<String, dynamic> toJson() => _$ShopByFabricToJson(this);
}

@JsonSerializable()
class Unstitched {
  @JsonKey(name: 'range_id')
  String? rangeId;
  String? name;
  String? description;
  String? image;

  Unstitched({this.rangeId, this.name, this.description, this.image});

  factory Unstitched.fromJson(Map<String, dynamic> json) =>
      _$UnstitchedFromJson(json);

  Map<String, dynamic> toJson() => _$UnstitchedToJson(this);
}

@JsonSerializable()
class BoutiqueCollection {
  @JsonKey(name: 'banner_image')
  String? bannerImage;
  String? name;
  String? cta;
  @JsonKey(name: 'banner_id')
  String? bannerId;

  BoutiqueCollection({this.bannerImage, this.name, this.cta, this.bannerId});

  factory BoutiqueCollection.fromJson(Map<String, dynamic> json) =>
      _$BoutiqueCollectionFromJson(json);

  Map<String, dynamic> toJson() => _$BoutiqueCollectionToJson(this);
}
