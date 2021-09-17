// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CharacterResponse _$CharacterResponseFromJson(Map<String, dynamic> json) {
  return CharacterResponse(
    (json['data'] as List<dynamic>)
        .map((e) => Data.fromJson(e as Map<String, dynamic>))
        .toList(),
    Meta.fromJson(json['meta'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CharacterResponseToJson(CharacterResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'meta': instance.meta,
    };

Meta _$MetaFromJson(Map<String, dynamic> json) {
  return Meta(
    json['count'] as int,
  );
}

Map<String, dynamic> _$MetaToJson(Meta instance) => <String, dynamic>{
      'count': instance.count,
    };

Data _$DataFromJson(Map<String, dynamic> json) {
  return Data(
    json['id'] as String,
  );
}

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'id': instance.id,
    };
