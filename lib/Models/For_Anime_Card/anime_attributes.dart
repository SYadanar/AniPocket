import 'package:json_annotation/json_annotation.dart';

part 'anime_attributes.g.dart';

@JsonSerializable()
class Attribute {
  final Title titles;
  final String averageRating;
  final Images posterImage;

  const Attribute(this.titles, this.averageRating, this.posterImage);

  factory Attribute.fromJson(Map<String, dynamic> json) =>
      _$AttributeFromJson(json);

  Map<String, dynamic> toJson() => _$AttributeToJson(this);
}

@JsonSerializable()
class Title {
  final String en_jp;

  const Title(this.en_jp);

  factory Title.fromJson(Map<String, dynamic> json) => _$TitleFromJson(json);

  Map<String, dynamic> toJson() => _$TitleToJson(this);
}

@JsonSerializable()
class Images {
  final String original;
  

  const Images(this.original);

  factory Images.fromJson(Map<String, dynamic> json) => _$ImagesFromJson(json);

  Map<String, dynamic> toJson() => _$ImagesToJson(this);
}

