import 'package:anime_app/Models/For_Anime_Detail/detail_attributes.dart';
import 'package:anime_app/Models/For_Anime_Detail/detail_relationships.dart';
import 'package:json_annotation/json_annotation.dart';

part 'detail_response.g.dart';

@JsonSerializable()
class AnimeDetailResponse {
  final AnimeData data;

  const AnimeDetailResponse(this.data);

  factory AnimeDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$AnimeDetailResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AnimeDetailResponseToJson(this);
}

@JsonSerializable()
class AnimeData {
  final String id;
  final String type;
  final SelfLinks links;
  final Attributes attributes;
  final Relationships relationships;

  const AnimeData(
      this.id, this.type, this.links, this.attributes, this.relationships);

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
