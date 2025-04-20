import 'package:json_annotation/json_annotation.dart';

part 'bottom_repository_model.g.dart';

@JsonSerializable()
class BottomRepositoryResponse {
  @JsonKey(name: 'range_of_pattern')
  List<RangeOfPattern>? rangeOfPattern;
  @JsonKey(name: 'design_occasion')
  List<DesignOccasion>? designOccasion;
  String? status;
  String? message;

  BottomRepositoryResponse({
    this.rangeOfPattern,
    this.designOccasion,
    this.status,
    this.message,
  });

  factory BottomRepositoryResponse.fromJson(Map<String, dynamic> json) =>
      _$BottomRepositoryResponseFromJson(json);

  Map<String, dynamic> toJson() => _$BottomRepositoryResponseToJson(this);
}

@JsonSerializable()
class RangeOfPattern {
  @JsonKey(name: 'product_id')
  String? productId;
  String? image;
  String? name;

  RangeOfPattern({this.productId, this.image, this.name});

  factory RangeOfPattern.fromJson(Map<String, dynamic> json) =>
      _$RangeOfPatternFromJson(json);

  Map<String, dynamic> toJson() => _$RangeOfPatternToJson(this);
}

@JsonSerializable()
class DesignOccasion {
  @JsonKey(name: 'product_id')
  String? productId;
  String? name;
  String? image;
  @JsonKey(name: 'sub_name')
  String? subName;
  String? cta;

  DesignOccasion({
    this.productId,
    this.name,
    this.image,
    this.subName,
    this.cta,
  });

  factory DesignOccasion.fromJson(Map<String, dynamic> json) =>
      _$DesignOccasionFromJson(json);

  Map<String, dynamic> toJson() => _$DesignOccasionToJson(this);
}
