// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_relationships.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Relationships _$RelationshipsFromJson(Map<String, dynamic> json) {
  return Relationships(
    Genres.fromJson(json['genres'] as Map<String, dynamic>),
    Characters.fromJson(json['characters'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$RelationshipsToJson(Relationships instance) =>
    <String, dynamic>{
      'genres': instance.genres,
      'characters': instance.characters,
    };

Genres _$GenresFromJson(Map<String, dynamic> json) {
  return Genres(
    Links.fromJson(json['links'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$GenresToJson(Genres instance) => <String, dynamic>{
      'links': instance.links,
    };

Characters _$CharactersFromJson(Map<String, dynamic> json) {
  return Characters(
    Links.fromJson(json['links'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CharactersToJson(Characters instance) =>
    <String, dynamic>{
      'links': instance.links,
    };

Links _$LinksFromJson(Map<String, dynamic> json) {
  return Links(
    json['related'] as String,
  );
}

Map<String, dynamic> _$LinksToJson(Links instance) => <String, dynamic>{
      'related': instance.related,
    };
