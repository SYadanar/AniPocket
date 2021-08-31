import 'package:anime_app/Models/For_Anime_Detail/detail_attributes.dart';
import 'package:anime_app/Models/For_Anime_Detail/detail_relationships.dart';
import 'package:json_annotation/json_annotation.dart';

part 'detail_response.g.dart';

@JsonSerializable()
class AnimeResponse {
  final List<Anime> data;

  const AnimeResponse(this.data);

  factory AnimeResponse.fromJson(Map<String, dynamic> json) =>
      _$AnimeResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AnimeResponseToJson(this);
}

@JsonSerializable()
class Anime {
  final String id;
  final String type;
  final SelfLinks links;
  final Attributes attributes;
  final Relationships relationships;

  const Anime(
      this.id, this.type, this.links, this.attributes, this.relationships);

  factory Anime.fromJson(Map<String, dynamic> json) => _$AnimeFromJson(json);

  Map<String, dynamic> toJson() => _$AnimeToJson(this);
}

@JsonSerializable()
class SelfLinks {
  final String self;

  const SelfLinks(this.self);

  factory SelfLinks.fromJson(Map<String, dynamic> json) =>
      _$SelfLinksFromJson(json);

  Map<String, dynamic> toJson() => _$SelfLinksToJson(this);
}
