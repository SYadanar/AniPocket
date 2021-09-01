// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'anime_relationship.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Relationship _$RelationshipFromJson(Map<String, dynamic> json) {
  return Relationship(
    Genre.fromJson(json['genres'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$RelationshipToJson(Relationship instance) =>
    <String, dynamic>{
      'genres': instance.genres,
    };

Genre _$GenreFromJson(Map<String, dynamic> json) {
  return Genre(
    Link.fromJson(json['links'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$GenreToJson(Genre instance) => <String, dynamic>{
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
