import 'package:json_annotation/json_annotation.dart';

part 'anime_relationship.g.dart';

@JsonSerializable()
class Relationship {
  final Genre genres;

  const Relationship(this.genres);

  factory Relationship.fromJson(Map<String, dynamic> json) =>
      _$RelationshipFromJson(json);

  Map<String, dynamic> toJson() => _$RelationshipToJson(this);
}

@JsonSerializable()
class Genre {
  final Link links;

  const Genre(this.links);

  factory Genre.fromJson(Map<String, dynamic> json) => _$GenreFromJson(json);

  Map<String, dynamic> toJson() => _$GenreToJson(this);
}

@JsonSerializable()
class Link {
  final String related;

  const Link(this.related);

  factory Link.fromJson(Map<String, dynamic> json) => _$LinkFromJson(json);

  Map<String, dynamic> toJson() => _$LinkToJson(this);
}
