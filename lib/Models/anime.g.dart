// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'anime.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Anime _$AnimeFromJson(Map<String, dynamic> json) {
  return Anime(
    json['id'] as String,
    json['type'] as String,
    Links.fromJson(json['links'] as Map<String, dynamic>),
    Attributes.fromJson(json['attributes'] as Map<String, dynamic>),
    Relationships.fromJson(json['relationships'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$AnimeToJson(Anime instance) => <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'links': instance.links,
      'attributes': instance.attributes,
      'relationships': instance.relationships,
    };

Links _$LinksFromJson(Map<String, dynamic> json) {
  return Links(
    json['self'] as String,
  );
}

Map<String, dynamic> _$LinksToJson(Links instance) => <String, dynamic>{
      'self': instance.self,
    };

Attributes _$AttributesFromJson(Map<String, dynamic> json) {
  return Attributes(
    json['description'] as String,
    Titles.fromJson(json['titles'] as Map<String, dynamic>),
    json['averageRating'] as String,
    json['startDate'] as String,
    json['endDate'] as String,
    json['nextRelease'] as String,
    json['popularityRank'] as String,
    json['ratingRank'] as String,
    json['ageRatingGuide'] as String,
    json['status'] as String,
    PosterImage.fromJson(json['posterImage'] as Map<String, dynamic>),
    CoverImage.fromJson(json['coverImage'] as Map<String, dynamic>),
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

PosterImage _$PosterImageFromJson(Map<String, dynamic> json) {
  return PosterImage(
    json['original'] as String,
  );
}

Map<String, dynamic> _$PosterImageToJson(PosterImage instance) =>
    <String, dynamic>{
      'original': instance.original,
    };

CoverImage _$CoverImageFromJson(Map<String, dynamic> json) {
  return CoverImage(
    json['original'] as String,
  );
}

Map<String, dynamic> _$CoverImageToJson(CoverImage instance) =>
    <String, dynamic>{
      'original': instance.original,
    };

Relationships _$RelationshipsFromJson(Map<String, dynamic> json) {
  return Relationships(
    Genres.fromJson(json['genres'] as Map<String, dynamic>),
    AnimeCharacters.fromJson(json['animeCharacters'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$RelationshipsToJson(Relationships instance) =>
    <String, dynamic>{
      'genres': instance.genres,
      'animeCharacters': instance.animeCharacters,
    };

Genres _$GenresFromJson(Map<String, dynamic> json) {
  return Genres(
    Glinks.fromJson(json['links'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$GenresToJson(Genres instance) => <String, dynamic>{
      'links': instance.links,
    };

AnimeCharacters _$AnimeCharactersFromJson(Map<String, dynamic> json) {
  return AnimeCharacters(
    Alinks.fromJson(json['links'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$AnimeCharactersToJson(AnimeCharacters instance) =>
    <String, dynamic>{
      'links': instance.links,
    };

Glinks _$GlinksFromJson(Map<String, dynamic> json) {
  return Glinks(
    json['related'] as String,
  );
}

Map<String, dynamic> _$GlinksToJson(Glinks instance) => <String, dynamic>{
      'related': instance.related,
    };

Alinks _$AlinksFromJson(Map<String, dynamic> json) {
  return Alinks(
    json['related'] as String,
  );
}

Map<String, dynamic> _$AlinksToJson(Alinks instance) => <String, dynamic>{
      'related': instance.related,
    };
