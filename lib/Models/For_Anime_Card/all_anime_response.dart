import 'package:anime_app/Models/For_Anime_Card/anime_attributes.dart';
import 'package:anime_app/Models/For_Anime_Card/anime_relationship.dart';
import 'package:json_annotation/json_annotation.dart';



part 'all_anime_response.g.dart';

@JsonSerializable()
class AllAnime{
   @JsonKey(name: 'data')
  final List<AllAnimeData> animeData;
  final Meta meta;


   const AllAnime(this.animeData, this.meta);

   factory AllAnime.fromJson(Map<String, dynamic> json) => _$AllAnimeFromJson(json);

   Map<String, dynamic> toJson() => _$AllAnimeToJson(this);
}
@JsonSerializable()
class AllAnimeData {
  final String id;
  final SelfLinks links;
  final Attribute attributes;
  final Relationship relationships;

  const AllAnimeData(this.id, this.links, this.attributes, this.relationships);

  factory AllAnimeData.fromJson(Map<String, dynamic> json) =>
      _$AllAnimeDataFromJson(json);

  Map<String, dynamic> toJson() => _$AllAnimeDataToJson(this);
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