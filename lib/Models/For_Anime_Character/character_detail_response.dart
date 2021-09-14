import 'package:json_annotation/json_annotation.dart';

part 'character_detail_response.g.dart';

@JsonSerializable()
class CharacterDetailResponse {
  final CharacterDetail data;

  const CharacterDetailResponse(this.data);

  factory CharacterDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$CharacterDetailResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CharacterDetailResponseToJson(this);
}

@JsonSerializable()
class CharacterDetail {
  final String id;
  final Attribute attributes;

  const CharacterDetail(this.id, this.attributes);

  factory CharacterDetail.fromJson(Map<String, dynamic> json) =>
      _$CharacterDetailFromJson(json);

  Map<String, dynamic> toJson() => _$CharacterDetailToJson(this);
}

@JsonSerializable()
class Attribute {
  final Name names;
  final String canonicalName;
  final String description;
  final CharacterImage? image;

  const Attribute(this.names, this.canonicalName, this.description, this.image);

  factory Attribute.fromJson(Map<String, dynamic> json) =>
      _$AttributeFromJson(json);

  Map<String, dynamic> toJson() => _$AttributeToJson(this);
}

@JsonSerializable()
class Name {
  final String? en;
  @JsonKey(name: 'ja_jp')
  final String? jp;

  const Name(this.en, this.jp);

  factory Name.fromJson(Map<String, dynamic> json) => _$NameFromJson(json);

  Map<String, dynamic> toJson() => _$NameToJson(this);
}

@JsonSerializable()
class CharacterImage {
  final String original;

  const CharacterImage(this.original);

  factory CharacterImage.fromJson(Map<String, dynamic> json) =>
      _$CharacterImageFromJson(json);

  Map<String, dynamic> toJson() => _$CharacterImageToJson(this);
}
