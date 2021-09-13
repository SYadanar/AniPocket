// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnimeName _$AnimeNameFromJson(Map<String, dynamic> json) {
  return AnimeName(
    (json['data'] as List<dynamic>)
        .map((e) => AllAnimeDatas.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$AnimeNameToJson(AnimeName instance) => <String, dynamic>{
      'data': instance.animeDataForName,
    };

AllAnimeDatas _$AllAnimeDatasFromJson(Map<String, dynamic> json) {
  return AllAnimeDatas(
    json['id'] as String,
    SelfLinks.fromJson(json['links'] as Map<String, dynamic>),
    Attribute.fromJson(json['attributes'] as Map<String, dynamic>),
    Relationship.fromJson(json['relationships'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$AllAnimeDatasToJson(AllAnimeDatas instance) =>
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

Attribute _$AttributeFromJson(Map<String, dynamic> json) {
  return Attribute(
    json['canonicalTitle'] as String,
    json['averageRating'] as String?,
  );
}

Map<String, dynamic> _$AttributeToJson(Attribute instance) => <String, dynamic>{
      'canonicalTitle': instance.canonicalTitle,
      'averageRating': instance.averageRating,
    };
