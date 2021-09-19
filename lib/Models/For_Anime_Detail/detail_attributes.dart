import 'package:json_annotation/json_annotation.dart';

part 'detail_attributes.g.dart';

@JsonSerializable()
class Attributes {
  final String? description;
  final String? canonicalTitle;
  final String? averageRating;
  final String? startDate;
  final String? endDate;
  final String? nextRelease;
  final int? popularityRank;
  final int? ratingRank;
  final String? ageRatingGuide;
  final String? status;
  final Image? posterImage;
  final Image? coverImage;
  final int? episodeCount;
  final int? episodeLength;
  final String? youtubeVideoId;

  const Attributes(
      this.description,
      this.canonicalTitle,
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
      this.youtubeVideoId);

  factory Attributes.fromJson(Map<String, dynamic> json) =>
      _$AttributesFromJson(json);

  Map<String, dynamic> toJson() => _$AttributesToJson(this);
}

@JsonSerializable()
class Image {
  final String original;

  const Image(this.original);

  factory Image.fromJson(Map<String, dynamic> json) => _$ImageFromJson(json);

  Map<String, dynamic> toJson() => _$ImageToJson(this);
}
