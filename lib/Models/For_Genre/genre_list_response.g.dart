// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'genre_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GenreListResponse _$GenreListResponseFromJson(Map<String, dynamic> json) {
  return GenreListResponse(
    (json['data'] as List<dynamic>)
        .map((e) => GenreList.fromJson(e as Map<String, dynamic>))
        .toList(),
    Meta.fromJson(json['meta'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$GenreListResponseToJson(GenreListResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'meta': instance.meta,
    };

GenreList _$GenreListFromJson(Map<String, dynamic> json) {
  return GenreList(
    json['id'] as String,
    SelfLinks.fromJson(json['links'] as Map<String, dynamic>),
    Attribute.fromJson(json['attributes'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$GenreListToJson(GenreList instance) => <String, dynamic>{
      'id': instance.id,
      'links': instance.links,
      'attributes': instance.attributes,
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
    json['name'] as String,
  );
}

Map<String, dynamic> _$AttributeToJson(Attribute instance) => <String, dynamic>{
      'name': instance.name,
    };

Meta _$MetaFromJson(Map<String, dynamic> json) {
  return Meta(
    json['count'] as int,
  );
}

Map<String, dynamic> _$MetaToJson(Meta instance) => <String, dynamic>{
      'count': instance.count,
    };
