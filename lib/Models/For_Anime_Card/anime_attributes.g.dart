// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'anime_attributes.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Attribute _$AttributeFromJson(Map<String, dynamic> json) {
  return Attribute(
    Title.fromJson(json['titles'] as Map<String, dynamic>),
    json['averageRating'] as String,
    Image.fromJson(json['posterImage'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$AttributeToJson(Attribute instance) => <String, dynamic>{
      'titles': instance.titles,
      'averageRating': instance.averageRating,
      'posterImage': instance.posterImage,
    };

Title _$TitleFromJson(Map<String, dynamic> json) {
  return Title(
    json['en'] as String,
  );
}

Map<String, dynamic> _$TitleToJson(Title instance) => <String, dynamic>{
      'en': instance.en,
    };

Image _$ImageFromJson(Map<String, dynamic> json) {
  return Image(
    json['original'] as String,
  );
}

Map<String, dynamic> _$ImageToJson(Image instance) => <String, dynamic>{
      'original': instance.original,
    };
