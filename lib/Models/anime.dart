import 'package:json_annotation/json_annotation.dart';

part 'anime.g.dart';

@JsonSerializable()
class Anime{

   final String id;
   final String type;
   final Links links;
   final Attributes attributes;
   final Relationships relationships;

   const Anime(this.id, this.type, this.links, this.attributes, this.relationships);

   factory Anime.fromJson(Map<String, dynamic> json) => 
   _$AnimeFromJson(json);

   Map<String, dynamic> toJson() => _$AnimeToJson(this);
}
@JsonSerializable()
class Links{
  final String self;

   const Links(this.self);

   factory Links.fromJson(Map<String, dynamic> json) => _$LinksFromJson(json);

   Map<String, dynamic> toJson() => _$LinksToJson(this);
}

@JsonSerializable()
class Attributes{
   final String description;
   final Titles titles;
   final String averageRating;
   final String startDate;
   final String endDate;
   final String nextRelease;
   final String popularityRank;
   final String ratingRank;
   final String ageRatingGuide;
   final String status;
   final PosterImage posterImage;
   final CoverImage coverImage;
   final String episodeCount;
   final String episodeLength;
   final String showType;
   final String youtubeVideoId;

   const Attributes(this.description, this.titles, this.averageRating, this.startDate, this.endDate, this.nextRelease, this.popularityRank, this.ratingRank, this.ageRatingGuide, this.status, this.posterImage, this.coverImage, this.episodeCount, this.episodeLength, this.showType, this.youtubeVideoId);

   factory Attributes.fromJson(Map<String, dynamic> json) => _$AttributesFromJson(json);

   Map<String, dynamic> toJson() => _$AttributesToJson(this);
}


@JsonSerializable()
class Titles{
   @JsonKey(name:'en')
   final String english;
   @JsonKey(name:'ja_jp')
   final String japan;

   const Titles(this.english, this.japan);

   factory Titles.fromJson(Map<String, dynamic> json) => _$TitlesFromJson(json);

   Map<String, dynamic> toJson() => _$TitlesToJson(this);
}

@JsonSerializable()
class PosterImage{
   final String original;
   const PosterImage(this.original);

   factory PosterImage.fromJson(Map<String, dynamic> json) => _$PosterImageFromJson(json);

   Map<String, dynamic> toJson() => _$PosterImageToJson(this);
}

@JsonSerializable()
class CoverImage{
   final String original;
   const CoverImage(this.original);

   factory CoverImage.fromJson(Map<String, dynamic> json) => _$CoverImageFromJson(json);

   Map<String, dynamic> toJson() => _$CoverImageToJson(this);
}

@JsonSerializable()
class Relationships{
   final Genres genres;
   final AnimeCharacters animeCharacters;
   const Relationships(this.genres, this.animeCharacters);

   factory Relationships.fromJson(Map<String, dynamic> json) => _$RelationshipsFromJson(json);

   Map<String, dynamic> toJson() => _$RelationshipsToJson(this);
}

@JsonSerializable()
class Genres{
   final Glinks links;

   const Genres(this.links);

   factory Genres.fromJson(Map<String, dynamic> json) => _$GenresFromJson(json);

   Map<String, dynamic> toJson() => _$GenresToJson(this);
}

@JsonSerializable()
class AnimeCharacters{
   final Alinks links;


   const AnimeCharacters(this.links);

   factory AnimeCharacters.fromJson(Map<String, dynamic> json) => _$AnimeCharactersFromJson(json);

   Map<String, dynamic> toJson() => _$AnimeCharactersToJson(this);
}

@JsonSerializable()
class Glinks{
   final String related;

   const Glinks(this.related);

   factory Glinks.fromJson(Map<String, dynamic> json) => _$GlinksFromJson(json);

   Map<String, dynamic> toJson() => _$GlinksToJson(this);
}

@JsonSerializable()
class Alinks{
   final String related;

   const Alinks(this.related);

   factory Alinks.fromJson(Map<String, dynamic> json) => _$AlinksFromJson(json);

   Map<String, dynamic> toJson() => _$AlinksToJson(this);
}