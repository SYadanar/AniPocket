import 'package:json_annotation/json_annotation.dart';

part 'anime_attributes.g.dart';

@JsonSerializable()
class Attribute {
  final Title titles;
  final String averageRating;
  final Image posterImage;

  const Attribute(this.titles, this.averageRating, this.posterImage);

  factory Attribute.fromJson(Map<String, dynamic> json) =>
      _$AttributeFromJson(json);

  Map<String, dynamic> toJson() => _$AttributeToJson(this);
}

@JsonSerializable()
class Title {
  final String en;

  const Title(this.en);

  factory Title.fromJson(Map<String, dynamic> json) => _$TitleFromJson(json);

  Map<String, dynamic> toJson() => _$TitleToJson(this);
}

@JsonSerializable()
class Image {
  final String original;

  const Image(this.original);

  factory Image.fromJson(Map<String, dynamic> json) => _$ImageFromJson(json);

  Map<String, dynamic> toJson() => _$ImageToJson(this);
}