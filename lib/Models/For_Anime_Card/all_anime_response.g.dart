// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_anime_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AllAnime _$AllAnimeFromJson(Map<String, dynamic> json) {
  return AllAnime(
    (json['data'] as List<dynamic>)
        .map((e) => AllAnimeData.fromJson(e as Map<String, dynamic>))
        .toList(),
    Meta.fromJson(json['meta'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$AllAnimeToJson(AllAnime instance) => <String, dynamic>{
      'data': instance.animeData,
      'meta': instance.meta,
    };

AllAnimeData _$AllAnimeDataFromJson(Map<String, dynamic> json) {
  return AllAnimeData(
    json['id'] as String,
    SelfLinks.fromJson(json['links'] as Map<String, dynamic>),
    Attribute.fromJson(json['attributes'] as Map<String, dynamic>),
    Relationship.fromJson(json['relationships'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$AllAnimeDataToJson(AllAnimeData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'links': instance.links,
      'attributes': instance.attributes,
      'relationships': instance.relationships,
    };

SelfLinks _$SelfLinksFromJson(Map<String, dynamic> json) {
  return SelfLinks(
    json['self'] as String,
  );
}

Map<String, dynamic> _$SelfLinksToJson(SelfLinks instance) => <String, dynamic>{
      'self': instance.self,
    };

Meta _$MetaFromJson(Map<String, dynamic> json) {
  return Meta(
    json['count'] as int,
  );
}

Map<String, dynamic> _$MetaToJson(Meta instance) => <String, dynamic>{
      'count': instance.count,
    };
