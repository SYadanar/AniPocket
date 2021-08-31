import 'package:json_annotation/json_annotation.dart';

import 'anime.dart';

part 'anime_response.g.dart';

@JsonSerializable()
class AnimeResponse{
   final List<Anime> data;

   const AnimeResponse(this.data);

   factory AnimeResponse.fromJson(Map<String, dynamic> json) => 
   _$AnimeResponseFromJson(json);

   Map<String, dynamic> toJson() => _$AnimeResponseToJson(this);

}

