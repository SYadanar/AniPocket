// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'anime_attributes.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Attribute _$AttributeFromJson(Map<String, dynamic> json) {
  return Attribute(
    json['canonicalTitle'] as String,
    json['averageRating'] as String?,
    Images.fromJson(json['posterImage'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$AttributeToJson(Attribute instance) => <String, dynamic>{
      'canonicalTitle': instance.canonicalTitle,
      'averageRating': instance.averageRating,
      'posterImage': instance.posterImage,
    };

Images _$ImagesFromJson(Map<String, dynamic> json) {
  return Images(
    json['original'] as String,
  );
}

Map<String, dynamic> _$ImagesToJson(Images instance) => <String, dynamic>{
      'original': instance.original,
    };
