import 'package:anime_app/Models/For_Anime_Card/anime_attributes.dart';
import 'package:anime_app/Models/For_Anime_Card/anime_relationship.dart';
import 'package:json_annotation/json_annotation.dart';

part 'related_anime_response.g.dart';

@JsonSerializable()
class RelatedAnimeResponse {
  final List<RelatedAnimeList> data;
  final Meta meta;

  const RelatedAnimeResponse(this.data, this.meta);

  factory RelatedAnimeResponse.fromJson(Map<String, dynamic> json) =>
      _$RelatedAnimeResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RelatedAnimeResponseToJson(this);
}

@JsonSerializable()
class RelatedAnimeList {
  final String id;
  final SelfLinks links;
  final Attribute attributes;
  final Relationship relationships;

  const RelatedAnimeList(
      this.id, this.links, this.attributes, this.relationships);

  factory RelatedAnimeList.fromJson(Map<String, dynamic> json) =>
      _$RelatedAnimeListFromJson(json);

  Map<String, dynamic> toJson() => _$RelatedAnimeListToJson(this);
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
class Meta {
  final int count;

  const Meta(this.count);

  factory Meta.fromJson(Map<String, dynamic> json) => _$MetaFromJson(json);

  Map<String, dynamic> toJson() => _$MetaToJson(this);
}
