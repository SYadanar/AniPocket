import 'package:json_annotation/json_annotation.dart';

part 'anime_response.g.dart';

@JsonSerializable()
class AnimeResponse{
   final List<Anime> data;

   const AnimeResponse(this.data);

   factory AnimeResponse.fromJson(Map<String, dynamic> json) => _$AnimeResponse
  FromJson(json);

   Map<String, dynamic> toJson() => _$AnimeResponseToJson(this);
}

@JsonSerializable()
class Anime{
   @JsonKey(name:'')
   final value value;

   const Anime();

   factory Anime.fromJson(Map<String, dynamic> json) => 
   _$AnimeFromJson(json);

   Map<String, dynamic> toJson() => _$AnimeToJson(this);
}