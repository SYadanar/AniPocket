import 'package:json_annotation/json_annotation.dart';

part 'detail_relationships.g.dart';

@JsonSerializable()
class Relationships{
   final Genres genres;
   final Characters characters;
   
   const Relationships(this.genres, this.characters);

   factory Relationships.fromJson(Map<String, dynamic> json) => _$RelationshipsFromJson(json);

   Map<String, dynamic> toJson() => _$RelationshipsToJson(this);
}

@JsonSerializable()
class Genres{
   final Links links;

   const Genres(this.links);

   factory Genres.fromJson(Map<String, dynamic> json) => _$GenresFromJson(json);

   Map<String, dynamic> toJson() => _$GenresToJson(this);
}

@JsonSerializable()
class Characters{
   final Links links;

   const Characters(this.links);

   factory Characters.fromJson(Map<String, dynamic> json) => _$CharactersFromJson(json);

   Map<String, dynamic> toJson() => _$CharactersToJson(this);
}

@JsonSerializable()
class Links{
   final String related;

   const Links(this.related);

   factory Links.fromJson(Map<String, dynamic> json) => _$LinksFromJson(json);

   Map<String, dynamic> toJson() => _$LinksToJson(this);
}