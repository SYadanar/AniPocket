import 'package:anime_app/Models/For_Anime_Card/anime_attributes.dart';
import 'package:anime_app/Models/For_Anime_Card/anime_relationship.dart';
import 'package:json_annotation/json_annotation.dart';

part 'anime_response.g.dart';

@JsonSerializable()
class AnimeResponse {
  @JsonKey(name: 'data')
  final List<AnimeData> animeData;

  const AnimeResponse(this.animeData);

  factory AnimeResponse.fromJson(Map<String, dynamic> json) =>
      _$AnimeResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AnimeResponseToJson(this);
}

@JsonSerializable()
class AnimeData {
  final String id;
  final SelfLinks links;
  final Attribute attributes;
  final Relationship relationships;

  const AnimeData(this.id, this.links, this.attributes, this.relationships);

  factory AnimeData.fromJson(Map<String, dynamic> json) =>
      _$AnimeDataFromJson(json);

  Map<String, dynamic> toJson() => _$AnimeDataToJson(this);
}

@JsonSerializable()
class SelfLinks {
  final String self;

  const SelfLinks(this.self);

  factory SelfLinks.fromJson(Map<String, dynamic> json) =>
      _$SelfLinksFromJson(json);

  Map<String, dynamic> toJson() => _$SelfLinksToJson(this);
}