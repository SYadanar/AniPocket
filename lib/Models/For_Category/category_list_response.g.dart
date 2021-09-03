// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryListResponse _$CategoryListResponseFromJson(Map<String, dynamic> json) {
  return CategoryListResponse(
    (json['data'] as List<dynamic>)
        .map((e) => CategoryList.fromJson(e as Map<String, dynamic>))
        .toList(),
    Meta.fromJson(json['meta'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CategoryListResponseToJson(
        CategoryListResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'meta': instance.meta,
    };

CategoryList _$CategoryListFromJson(Map<String, dynamic> json) {
  return CategoryList(
    Attribute.fromJson(json['attributes'] as Map<String, dynamic>),
    Relationship.fromJson(json['relationships'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CategoryListToJson(CategoryList instance) =>
    <String, dynamic>{
      'attributes': instance.attributes,
      'relationships': instance.relationships,
    };

Attribute _$AttributeFromJson(Map<String, dynamic> json) {
  return Attribute(
    json['title'] as String,
  );
}

Map<String, dynamic> _$AttributeToJson(Attribute instance) => <String, dynamic>{
      'title': instance.title,
    };

Relationship _$RelationshipFromJson(Map<String, dynamic> json) {
  return Relationship(
    Anime.fromJson(json['anime'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$RelationshipToJson(Relationship instance) =>
    <String, dynamic>{
      'anime': instance.anime,
    };

Anime _$AnimeFromJson(Map<String, dynamic> json) {
  return Anime(
    Link.fromJson(json['links'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$AnimeToJson(Anime instance) => <String, dynamic>{
      'links': instance.links,
    };

Link _$LinkFromJson(Map<String, dynamic> json) {
  return Link(
    json['related'] as String,
  );
}

Map<String, dynamic> _$LinkToJson(Link instance) => <String, dynamic>{
      'related': instance.related,
    };

Meta _$MetaFromJson(Map<String, dynamic> json) {
  return Meta(
    json['count'] as int,
  );
}

Map<String, dynamic> _$MetaToJson(Meta instance) => <String, dynamic>{
      'count': instance.count,
    };
