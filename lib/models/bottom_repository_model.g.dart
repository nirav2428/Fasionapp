// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bottom_repository_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BottomRepositoryResponse _$BottomRepositoryResponseFromJson(
  Map<String, dynamic> json,
) => BottomRepositoryResponse(
  rangeOfPattern:
      (json['range_of_pattern'] as List<dynamic>?)
          ?.map((e) => RangeOfPattern.fromJson(e as Map<String, dynamic>))
          .toList(),
  designOccasion:
      (json['design_occasion'] as List<dynamic>?)
          ?.map((e) => DesignOccasion.fromJson(e as Map<String, dynamic>))
          .toList(),
  status: json['status'] as String?,
  message: json['message'] as String?,
);

Map<String, dynamic> _$BottomRepositoryResponseToJson(
  BottomRepositoryResponse instance,
) => <String, dynamic>{
  'range_of_pattern': instance.rangeOfPattern,
  'design_occasion': instance.designOccasion,
  'status': instance.status,
  'message': instance.message,
};

RangeOfPattern _$RangeOfPatternFromJson(Map<String, dynamic> json) =>
    RangeOfPattern(
      productId: json['product_id'] as String?,
      image: json['image'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$RangeOfPatternToJson(RangeOfPattern instance) =>
    <String, dynamic>{
      'product_id': instance.productId,
      'image': instance.image,
      'name': instance.name,
    };

DesignOccasion _$DesignOccasionFromJson(Map<String, dynamic> json) =>
    DesignOccasion(
      productId: json['product_id'] as String?,
      name: json['name'] as String?,
      image: json['image'] as String?,
      subName: json['sub_name'] as String?,
      cta: json['cta'] as String?,
    );

Map<String, dynamic> _$DesignOccasionToJson(DesignOccasion instance) =>
    <String, dynamic>{
      'product_id': instance.productId,
      'name': instance.name,
      'image': instance.image,
      'sub_name': instance.subName,
      'cta': instance.cta,
    };
