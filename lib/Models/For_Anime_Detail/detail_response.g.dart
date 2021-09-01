// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnimeResponse _$AnimeResponseFromJson(Map<String, dynamic> json) {
  return AnimeResponse(
    (json['data'] as List<dynamic>)
        .map((e) => Anime.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$AnimeResponseToJson(AnimeResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

Anime _$AnimeFromJson(Map<String, dynamic> json) {
  return Anime(
    json['id'] as String,
    json['type'] as String,
    SelfLinks.fromJson(json['links'] as Map<String, dynamic>),
    Attributes.fromJson(json['attributes'] as Map<String, dynamic>),
    Relationships.fromJson(json['relationships'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$AnimeToJson(Anime instance) => <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
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
