// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_attributes.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Attributes _$AttributesFromJson(Map<String, dynamic> json) {
  return Attributes(
    json['description'] as String,
    Titles.fromJson(json['titles'] as Map<String, dynamic>),
    json['averageRating'] as String,
    json['startDate'] as String,
    json['endDate'] as String?,
    json['nextRelease'] as String?,
    json['popularityRank'] as String,
    json['ratingRank'] as String,
    json['ageRatingGuide'] as String,
    json['status'] as String,
    Image.fromJson(json['posterImage'] as Map<String, dynamic>),
    Image.fromJson(json['coverImage'] as Map<String, dynamic>),
    json['episodeCount'] as String,
    json['episodeLength'] as String,
    json['showType'] as String,
    json['youtubeVideoId'] as String,
  );
}

Map<String, dynamic> _$AttributesToJson(Attributes instance) =>
    <String, dynamic>{
      'description': instance.description,
      'titles': instance.titles,
      'averageRating': instance.averageRating,
      'startDate': instance.startDate,
      'endDate': instance.endDate,
      'nextRelease': instance.nextRelease,
      'popularityRank': instance.popularityRank,
      'ratingRank': instance.ratingRank,
      'ageRatingGuide': instance.ageRatingGuide,
      'status': instance.status,
      'posterImage': instance.posterImage,
      'coverImage': instance.coverImage,
      'episodeCount': instance.episodeCount,
      'episodeLength': instance.episodeLength,
      'showType': instance.showType,
      'youtubeVideoId': instance.youtubeVideoId,
    };

Titles _$TitlesFromJson(Map<String, dynamic> json) {
  return Titles(
    json['en'] as String,
    json['ja_jp'] as String,
  );
}

Map<String, dynamic> _$TitlesToJson(Titles instance) => <String, dynamic>{
      'en': instance.english,
      'ja_jp': instance.japan,
    };

Image _$ImageFromJson(Map<String, dynamic> json) {
  return Image(
    json['original'] as String,
  );
}

Map<String, dynamic> _$ImageToJson(Image instance) => <String, dynamic>{
      'original': instance.original,
    };
