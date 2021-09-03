// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'anime_attributes.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Attribute _$AttributeFromJson(Map<String, dynamic> json) {
  return Attribute(
    json['canonicalTitle'] as String,
    json['averageRating'] as String?,
    Image.fromJson(json['posterImage'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$AttributeToJson(Attribute instance) => <String, dynamic>{
      'canonicalTitle': instance.canonicalTitle,
      'averageRating': instance.averageRating,
      'posterImage': instance.posterImage,
    };

Image _$ImageFromJson(Map<String, dynamic> json) {
  return Image(
    json['original'] as String,
  );
}

Map<String, dynamic> _$ImageToJson(Image instance) => <String, dynamic>{
      'original': instance.original,
    };
