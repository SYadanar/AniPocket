import 'package:json_annotation/json_annotation.dart';

part 'detail_attributes.g.dart';

@JsonSerializable()
class Attributes {
  final String description;
  final Titles titles;
  final String averageRating;
  final String startDate;
  final String? endDate;
  final String? nextRelease;
  final String popularityRank;
  final String ratingRank;
  final String ageRatingGuide;
  final String status;
  final Image posterImage;
  final Image coverImage;
  final String episodeCount;
  final String episodeLength;
  final String showType;
  final String youtubeVideoId;

  const Attributes(
      this.description,
      this.titles,
      this.averageRating,
      this.startDate,
      this.endDate,
      this.nextRelease,
      this.popularityRank,
      this.ratingRank,
      this.ageRatingGuide,
      this.status,
      this.posterImage,
      this.coverImage,
      this.episodeCount,
      this.episodeLength,
      this.showType,
      this.youtubeVideoId);

  factory Attributes.fromJson(Map<String, dynamic> json) =>
      _$AttributesFromJson(json);

  Map<String, dynamic> toJson() => _$AttributesToJson(this);
}

@JsonSerializable()
class Titles {
  @JsonKey(name: 'en')
  final String english;
  @JsonKey(name: 'ja_jp')
  final String japan;

  const Titles(this.english, this.japan);

  factory Titles.fromJson(Map<String, dynamic> json) => _$TitlesFromJson(json);

  Map<String, dynamic> toJson() => _$TitlesToJson(this);
}

@JsonSerializable()
class Image{
   final String original;

   const Image(this.original);

   factory Image.fromJson(Map<String, dynamic> json) => _$ImageFromJson(json);

   Map<String, dynamic> toJson() => _$ImageToJson(this);
}