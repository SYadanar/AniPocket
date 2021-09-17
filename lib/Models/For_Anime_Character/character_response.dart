import 'package:json_annotation/json_annotation.dart';

part 'character_response.g.dart';

@JsonSerializable()
class CharacterResponse {
  final List<Data> data;
  final Meta meta;

  const CharacterResponse(this.data, this.meta);

  factory CharacterResponse.fromJson(Map<String, dynamic> json) =>
      _$CharacterResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CharacterResponseToJson(this);
}

@JsonSerializable()
class Meta {
  final int count;

  const Meta(this.count);

  factory Meta.fromJson(Map<String, dynamic> json) => _$MetaFromJson(json);

  Map<String, dynamic> toJson() => _$MetaToJson(this);
}

@JsonSerializable()
class Data {
  final String id;

  const Data(this.id);

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
