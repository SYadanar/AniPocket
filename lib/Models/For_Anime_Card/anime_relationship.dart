import 'package:json_annotation/json_annotation.dart';

part 'anime_relationship.g.dart';

@JsonSerializable()
class Relationship {
  final Category categories;

  const Relationship(this.categories);

  factory Relationship.fromJson(Map<String, dynamic> json) =>
      _$RelationshipFromJson(json);

  Map<String, dynamic> toJson() => _$RelationshipToJson(this);
}

@JsonSerializable()
class Category {
  final Link links;

  const Category(this.links);

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryToJson(this);
}

@JsonSerializable()
class Link {
  final String related;

  const Link(this.related);

  factory Link.fromJson(Map<String, dynamic> json) => _$LinkFromJson(json);

  Map<String, dynamic> toJson() => _$LinkToJson(this);
}
