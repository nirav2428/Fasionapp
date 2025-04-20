import 'package:json_annotation/json_annotation.dart';

part 'top_repository_model.g.dart';

@JsonSerializable()
class TopRepositoryResponse {
  @JsonKey(name: 'main_sticky_menu')
  List<MainStickyMenu>? mainStickyMenu;
  String? status;
  String? message;

  TopRepositoryResponse({this.mainStickyMenu, this.status, this.message});

  factory TopRepositoryResponse.fromJson(Map<String, dynamic> json) =>
      _$TopRepositoryResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TopRepositoryResponseToJson(this);
}

@JsonSerializable()
class MainStickyMenu {
  String? title;
  String? image;
  @JsonKey(name: 'sort_order')
  String? sortOrder;
  @JsonKey(name: 'slider_images')
  List<SliderImage>? sliderImages;

  MainStickyMenu({this.title, this.image, this.sortOrder, this.sliderImages});

  factory MainStickyMenu.fromJson(Map<String, dynamic> json) =>
      _$MainStickyMenuFromJson(json);

  Map<String, dynamic> toJson() => _$MainStickyMenuToJson(this);
}

@JsonSerializable()
class SliderImage {
  String? title;
  String? image;
  @JsonKey(name: 'sort_order')
  String? sortOrder;
  String? cta;

  SliderImage({this.title, this.image, this.sortOrder, this.cta});

  factory SliderImage.fromJson(Map<String, dynamic> json) =>
      _$SliderImageFromJson(json);

  Map<String, dynamic> toJson() => _$SliderImageToJson(this);
}
