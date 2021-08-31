// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'anime_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnimeResponse _$AnimeResponseFromJson(Map<String, dynamic> json) {
  return AnimeResponse(
    (json['data'] as List<dynamic>)
        .map((e) => Anime.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$AnimeResponseToJson(AnimeResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
