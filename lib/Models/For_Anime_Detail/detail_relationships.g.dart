// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_relationships.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Relationships _$RelationshipsFromJson(Map<String, dynamic> json) {
  return Relationships(
    Category.fromJson(json['categories'] as Map<String, dynamic>),
    AnimeCharacter.fromJson(json['animeCharacters'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$RelationshipsToJson(Relationships instance) =>
    <String, dynamic>{
      'categories': instance.categories,
      'animeCharacters': instance.animeCharacters,
    };

Category _$CategoryFromJson(Map<String, dynamic> json) {
  return Category(
    Links.fromJson(json['links'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CategoryToJson(Category instance) => <String, dynamic>{
      'links': instance.links,
    };

AnimeCharacter _$AnimeCharacterFromJson(Map<String, dynamic> json) {
  return AnimeCharacter(
    Links.fromJson(json['links'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$AnimeCharacterToJson(AnimeCharacter instance) =>
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
