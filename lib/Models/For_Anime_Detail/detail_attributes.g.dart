// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_attributes.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Attributes _$AttributesFromJson(Map<String, dynamic> json) {
  return Attributes(
    json['description'] as String?,
    json['canonicalTitle'] as String?,
    json['averageRating'] as String?,
    json['startDate'] as String?,
    json['endDate'] as String?,
    json['nextRelease'] as String?,
    json['popularityRank'] as int?,
    json['ratingRank'] as int?,
    json['ageRatingGuide'] as String?,
    json['status'] as String?,
    json['posterImage'] == null
        ? null
        : Image.fromJson(json['posterImage'] as Map<String, dynamic>),
    json['coverImage'] == null
        ? null
        : Image.fromJson(json['coverImage'] as Map<String, dynamic>),
    json['episodeCount'] as int?,
    json['episodeLength'] as int?,
    json['youtubeVideoId'] as String?,
  );
}

Map<String, dynamic> _$AttributesToJson(Attributes instance) =>
    <String, dynamic>{
      'description': instance.description,
      'canonicalTitle': instance.canonicalTitle,
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
      'youtubeVideoId': instance.youtubeVideoId,
    };

Image _$ImageFromJson(Map<String, dynamic> json) {
  return Image(
    json['original'] as String,
  );
}

Map<String, dynamic> _$ImageToJson(Image instance) => <String, dynamic>{
      'original': instance.original,
    };
