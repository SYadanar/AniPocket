import 'package:json_annotation/json_annotation.dart';

part 'detail_relationships.g.dart';

@JsonSerializable()
class Relationships {
  final Category categories;
  final AnimeCharacter animeCharacters;

  const Relationships(this.categories, this.animeCharacters);

  factory Relationships.fromJson(Map<String, dynamic> json) =>
      _$RelationshipsFromJson(json);

  Map<String, dynamic> toJson() => _$RelationshipsToJson(this);
}

@JsonSerializable()
class Category {
  final Links links;

  const Category(this.links);

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryToJson(this);
}

@JsonSerializable()
class AnimeCharacter {
  final Links links;

  const AnimeCharacter(this.links);

  factory AnimeCharacter.fromJson(Map<String, dynamic> json) =>
      _$AnimeCharacterFromJson(json);

  Map<String, dynamic> toJson() => _$AnimeCharacterToJson(this);
}

@JsonSerializable()
class Links {
  final String related;

  const Links(this.related);

  factory Links.fromJson(Map<String, dynamic> json) => _$LinksFromJson(json);

  Map<String, dynamic> toJson() => _$LinksToJson(this);
}
