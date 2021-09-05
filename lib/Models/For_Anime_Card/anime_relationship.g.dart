// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'anime_relationship.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Relationship _$RelationshipFromJson(Map<String, dynamic> json) {
  return Relationship(
    Category.fromJson(json['categories'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$RelationshipToJson(Relationship instance) =>
    <String, dynamic>{
      'categories': instance.categories,
    };

Category _$CategoryFromJson(Map<String, dynamic> json) {
  return Category(
    Link.fromJson(json['links'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CategoryToJson(Category instance) => <String, dynamic>{
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
