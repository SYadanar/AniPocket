// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'anime_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnimeResponse _$AnimeResponseFromJson(Map<String, dynamic> json) {
  return AnimeResponse(
    (json['data'] as List<dynamic>)
        .map((e) => AnimeData.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$AnimeResponseToJson(AnimeResponse instance) =>
    <String, dynamic>{
      'data': instance.animeData,
    };

AnimeData _$AnimeDataFromJson(Map<String, dynamic> json) {
  return AnimeData(
    json['id'] as String,
    Link.fromJson(json['links'] as Map<String, dynamic>),
    Attribute.fromJson(json['attributes'] as Map<String, dynamic>),
    Relationship.fromJson(json['relationships'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$AnimeDataToJson(AnimeData instance) => <String, dynamic>{
      'id': instance.id,
      'links': instance.links,
      'attributes': instance.attributes,
      'relationships': instance.relationships,
    };

Link _$LinkFromJson(Map<String, dynamic> json) {
  return Link(
    json['self'] as String,
  );
}

Map<String, dynamic> _$LinkToJson(Link instance) => <String, dynamic>{
      'self': instance.self,
    };
