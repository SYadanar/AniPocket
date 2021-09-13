import 'package:anime_app/Models/For_Anime_Card/anime_relationship.dart';

import 'package:json_annotation/json_annotation.dart';

part 'search_.g.dart';

@JsonSerializable()
class AnimeName {
  @JsonKey(name: 'data')
  final List<AllAnimeDatas> animeDataForName;

  const AnimeName(this.animeDataForName);

  factory AnimeName.fromJson(Map<String, dynamic> json) =>
      _$AnimeNameFromJson(json);

  Map<String, dynamic> toJson() => _$AnimeNameToJson(this);
}

@JsonSerializable()
class AllAnimeDatas {
  final String id;
  final SelfLinks links;
  final Attribute attributes;
  final Relationship relationships;

  const AllAnimeDatas(this.id, this.links, this.attributes, this.relationships);

  factory AllAnimeDatas.fromJson(Map<String, dynamic> json) =>
      _$AllAnimeDatasFromJson(json);

  Map<String, dynamic> toJson() => _$AllAnimeDatasToJson(this);
}

@JsonSerializable()
class SelfLinks {
  final String self;

  const SelfLinks(this.self);

  factory SelfLinks.fromJson(Map<String, dynamic> json) =>
      _$SelfLinksFromJson(json);

  Map<String, dynamic> toJson() => _$SelfLinksToJson(this);
}

@JsonSerializable()
class Attribute {
  final String canonicalTitle;
  final String? averageRating;

  const Attribute(this.canonicalTitle, this.averageRating);

  factory Attribute.fromJson(Map<String, dynamic> json) =>
      _$AttributeFromJson(json);

  Map<String, dynamic> toJson() => _$AttributeToJson(this);
}
