// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'anime_attributes.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Attribute _$AttributeFromJson(Map<String, dynamic> json) {
  return Attribute(
    Title.fromJson(json['titles'] as Map<String, dynamic>),
    json['averageRating'] as String,
    Images.fromJson(json['posterImage'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$AttributeToJson(Attribute instance) => <String, dynamic>{
      'titles': instance.titles,
      'averageRating': instance.averageRating,
      'posterImage': instance.posterImage,
    };

Title _$TitleFromJson(Map<String, dynamic> json) {
  return Title(
    json['en_jp'] as String,
  );
}

Map<String, dynamic> _$TitleToJson(Title instance) => <String, dynamic>{
      'en_jp': instance.en_jp,
    };

Images _$ImagesFromJson(Map<String, dynamic> json) {
  return Images(
    json['original'] as String,
  );
}

Map<String, dynamic> _$ImagesToJson(Images instance) => <String, dynamic>{
      'original': instance.original,
    };
