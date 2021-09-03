import 'package:json_annotation/json_annotation.dart';

part 'category_list_response.g.dart';

@JsonSerializable()
class CategoryListResponse {
  final List<CategoryList> data;
  final Meta meta;

  const CategoryListResponse(this.data, this.meta);

  factory CategoryListResponse.fromJson(Map<String, dynamic> json) =>
      _$CategoryListResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryListResponseToJson(this);
}

@JsonSerializable()
class CategoryList {
  final Attribute attributes;
  final Relationship relationships;

  const CategoryList(this.attributes, this.relationships);

  factory CategoryList.fromJson(Map<String, dynamic> json) =>
      _$CategoryListFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryListToJson(this);
}

@JsonSerializable()
class Attribute {
  final String title;

  const Attribute(this.title);

  factory Attribute.fromJson(Map<String, dynamic> json) =>
      _$AttributeFromJson(json);

  Map<String, dynamic> toJson() => _$AttributeToJson(this);
}

@JsonSerializable()
class Relationship {
  final Anime anime;

  const Relationship(this.anime);

  factory Relationship.fromJson(Map<String, dynamic> json) =>
      _$RelationshipFromJson(json);

  Map<String, dynamic> toJson() => _$RelationshipToJson(this);
}

@JsonSerializable()
class Anime {
  final Link links;

  const Anime(this.links);

  factory Anime.fromJson(Map<String, dynamic> json) => _$AnimeFromJson(json);

  Map<String, dynamic> toJson() => _$AnimeToJson(this);
}

@JsonSerializable()
class Link {
  final String related;

  const Link(this.related);

  factory Link.fromJson(Map<String, dynamic> json) => _$LinkFromJson(json);

  Map<String, dynamic> toJson() => _$LinkToJson(this);
}

@JsonSerializable()
class Meta {
  final int count;

  const Meta(this.count);

  factory Meta.fromJson(Map<String, dynamic> json) => _$MetaFromJson(json);

  Map<String, dynamic> toJson() => _$MetaToJson(this);
}
