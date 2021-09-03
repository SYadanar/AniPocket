import 'package:json_annotation/json_annotation.dart';

part 'anime_attributes.g.dart';

@JsonSerializable()
class Attribute {
  final String canonicalTitle;
  final String? averageRating;
  final Image posterImage;

  const Attribute(this.canonicalTitle, this.averageRating, this.posterImage);

  factory Attribute.fromJson(Map<String, dynamic> json) =>
      _$AttributeFromJson(json);

  Map<String, dynamic> toJson() => _$AttributeToJson(this);
}

@JsonSerializable()
class Image {
  final String original;

  const Image(this.original);

  factory Image.fromJson(Map<String, dynamic> json) => _$ImageFromJson(json);

  Map<String, dynamic> toJson() => _$ImageToJson(this);
}
