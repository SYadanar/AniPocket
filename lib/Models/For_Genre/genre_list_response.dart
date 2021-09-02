import 'package:json_annotation/json_annotation.dart';

part 'genre_list_response.g.dart';

@JsonSerializable()
class GenreListResponse {
  final List<GenreList> data;
  final Meta meta;

  const GenreListResponse(this.data, this.meta);

  factory GenreListResponse.fromJson(Map<String, dynamic> json) =>
      _$GenreListResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GenreListResponseToJson(this);
}

@JsonSerializable()
class GenreList {
  final String id;
  final SelfLinks links;
  final Attribute attributes;

  const GenreList(this.id, this.links, this.attributes);

  factory GenreList.fromJson(Map<String, dynamic> json) =>
      _$GenreListFromJson(json);

  Map<String, dynamic> toJson() => _$GenreListToJson(this);
}

@JsonSerializable()
class SelfLinks {
  final String self;

  const SelfLinks(this.self);

  factory SelfLinks.fromJson(Map<String, dynamic> json) =>
      _$SelfLinksFromJson(json);

  Map<String, dynamic> toJson() => _$SelfLinksToJson(this);
}

@JsonSerializable()
class Attribute {
  final String name;

  const Attribute(this.name);

  factory Attribute.fromJson(Map<String, dynamic> json) =>
      _$AttributeFromJson(json);

  Map<String, dynamic> toJson() => _$AttributeToJson(this);
}

@JsonSerializable()
class Meta {
  final int count;

  const Meta(this.count);

  factory Meta.fromJson(Map<String, dynamic> json) => _$MetaFromJson(json);

  Map<String, dynamic> toJson() => _$MetaToJson(this);
}
