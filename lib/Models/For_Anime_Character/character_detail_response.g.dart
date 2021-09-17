// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_detail_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CharacterDetailResponse _$CharacterDetailResponseFromJson(
    Map<String, dynamic> json) {
  return CharacterDetailResponse(
    CharacterDetail.fromJson(json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CharacterDetailResponseToJson(
        CharacterDetailResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

CharacterDetail _$CharacterDetailFromJson(Map<String, dynamic> json) {
  return CharacterDetail(
    json['id'] as String,
    Attribute.fromJson(json['attributes'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CharacterDetailToJson(CharacterDetail instance) =>
    <String, dynamic>{
      'id': instance.id,
      'attributes': instance.attributes,
    };

Attribute _$AttributeFromJson(Map<String, dynamic> json) {
  return Attribute(
    Name.fromJson(json['names'] as Map<String, dynamic>),
    json['canonicalName'] as String,
    json['description'] as String,
    json['image'] == null
        ? null
        : CharacterImage.fromJson(json['image'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$AttributeToJson(Attribute instance) => <String, dynamic>{
      'names': instance.names,
      'canonicalName': instance.canonicalName,
      'description': instance.description,
      'image': instance.image,
    };

Name _$NameFromJson(Map<String, dynamic> json) {
  return Name(
    json['en'] as String?,
    json['ja_jp'] as String?,
  );
}

Map<String, dynamic> _$NameToJson(Name instance) => <String, dynamic>{
      'en': instance.en,
      'ja_jp': instance.jp,
    };

CharacterImage _$CharacterImageFromJson(Map<String, dynamic> json) {
  return CharacterImage(
    json['original'] as String,
  );
}

Map<String, dynamic> _$CharacterImageToJson(CharacterImage instance) =>
    <String, dynamic>{
      'original': instance.original,
    };
