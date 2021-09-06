// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnimeDetailResponse _$AnimeDetailResponseFromJson(Map<String, dynamic> json) {
  return AnimeDetailResponse(
    AnimeData.fromJson(json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$AnimeDetailResponseToJson(
        AnimeDetailResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

AnimeData _$AnimeDataFromJson(Map<String, dynamic> json) {
  return AnimeData(
    json['id'] as String,
    json['type'] as String,
    SelfLinks.fromJson(json['links'] as Map<String, dynamic>),
    Attributes.fromJson(json['attributes'] as Map<String, dynamic>),
    Relationships.fromJson(json['relationships'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$AnimeDataToJson(AnimeData instance) => <String, dynamic>{
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
