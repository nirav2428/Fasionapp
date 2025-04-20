// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'top_repository_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TopRepositoryResponse _$TopRepositoryResponseFromJson(
  Map<String, dynamic> json,
) => TopRepositoryResponse(
  mainStickyMenu:
      (json['main_sticky_menu'] as List<dynamic>?)
          ?.map((e) => MainStickyMenu.fromJson(e as Map<String, dynamic>))
          .toList(),
  status: json['status'] as String?,
  message: json['message'] as String?,
);

Map<String, dynamic> _$TopRepositoryResponseToJson(
  TopRepositoryResponse instance,
) => <String, dynamic>{
  'main_sticky_menu': instance.mainStickyMenu,
  'status': instance.status,
  'message': instance.message,
};

MainStickyMenu _$MainStickyMenuFromJson(Map<String, dynamic> json) =>
    MainStickyMenu(
      title: json['title'] as String?,
      image: json['image'] as String?,
      sortOrder: json['sort_order'] as String?,
      sliderImages:
          (json['slider_images'] as List<dynamic>?)
              ?.map((e) => SliderImage.fromJson(e as Map<String, dynamic>))
              .toList(),
    );

Map<String, dynamic> _$MainStickyMenuToJson(MainStickyMenu instance) =>
    <String, dynamic>{
      'title': instance.title,
      'image': instance.image,
      'sort_order': instance.sortOrder,
      'slider_images': instance.sliderImages,
    };

SliderImage _$SliderImageFromJson(Map<String, dynamic> json) => SliderImage(
  title: json['title'] as String?,
  image: json['image'] as String?,
  sortOrder: json['sort_order'] as String?,
  cta: json['cta'] as String?,
);

Map<String, dynamic> _$SliderImageToJson(SliderImage instance) =>
    <String, dynamic>{
      'title': instance.title,
      'image': instance.image,
      'sort_order': instance.sortOrder,
      'cta': instance.cta,
    };
