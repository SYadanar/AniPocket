import 'package:anime_app/Models/For_Anime_Detail/detail_response.dart';
import 'package:anime_app/Widgets/anime_detail.dart';
import 'package:anime_app/service/api_service.dart';
import 'package:flutter/material.dart';

class AnimeDetailPage extends StatefulWidget {
  final String clickedUrl;
  const AnimeDetailPage({Key? key, required this.clickedUrl}) : super(key: key);

  @override
  _AnimeDetailPageState createState() => _AnimeDetailPageState();
}

class _AnimeDetailPageState extends State<AnimeDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder<AnimeDetailResponse>(
          future: ApiService().getAnimeDetail(widget.clickedUrl),
          builder: (context, snapshot) {
            String coverImg = "https://ibb.co/MGsSyyN";
            String rating = "N/A";
            String startDate = "N/A";
            String endDate = "N/A";
            String nextRelease = "N/A";
            String popularityRank = "N/A";
            String ratingRank = "N/A";
            String ageRatingGuide = "N/A";
            String episodeCount = "N/A";
            String episodeLength = "N/A";
            String title = 'N/A';
            String statue = 'N/A';

            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return const CircularProgressIndicator();
              default:
                if (snapshot.hasError) {
                  return Center(
                    child: Text(snapshot.error.toString()),
                  );
                } else {
                  if (snapshot.data!.data.attributes.coverImage != null)
                    coverImg =
                        snapshot.data!.data.attributes.coverImage!.original;
                  if (snapshot.data!.data.attributes.averageRating != null)
                    rating = snapshot.data!.data.attributes.averageRating!;
                  if (snapshot.data!.data.attributes.startDate != null)
                    startDate = snapshot.data!.data.attributes.startDate!;
                  if (snapshot.data!.data.attributes.endDate != null)
                    endDate = snapshot.data!.data.attributes.endDate!;
                  if (snapshot.data!.data.attributes.nextRelease != null)
                    nextRelease = snapshot.data!.data.attributes.nextRelease!;
                  if (snapshot.data!.data.attributes.popularityRank != null)
                    popularityRank = snapshot
                        .data!.data.attributes.popularityRank
                        .toString();
                  if (snapshot.data!.data.attributes.ratingRank != null)
                    ratingRank =
                        snapshot.data!.data.attributes.ratingRank.toString();
                  if (snapshot.data!.data.attributes.ageRatingGuide != null)
                    ageRatingGuide =
                        snapshot.data!.data.attributes.ageRatingGuide!;
                  if (snapshot.data!.data.attributes.episodeCount != null)
                    episodeCount =
                        snapshot.data!.data.attributes.episodeCount.toString();
                  if (snapshot.data!.data.attributes.episodeLength != null)
                    episodeLength =
                        snapshot.data!.data.attributes.episodeLength.toString();

                  if (snapshot.data!.data.attributes.canonicalTitle != null)
                    title = snapshot.data!.data.attributes.canonicalTitle
                        .toString();

                  if (snapshot.data!.data.attributes.status != null)
                    statue = snapshot.data!.data.attributes.status.toString();
                  return AnimeDetail(
                    coverImageUrl: coverImg,
                    rating: rating,
                    overview: snapshot.data!.data.attributes.description,
                    animeTitle: title,
                    categoryUrl: snapshot
                        .data!.data.relationships.categories.links.related,
                    startDate: startDate,
                    endDate: endDate,
                    nextRelease: nextRelease,
                    popularityRank: popularityRank,
                    ratingRank: ratingRank,
                    ageRatingGuide: ageRatingGuide,
                    status: statue,
                    episodeCount: episodeCount,
                    episodeLength: episodeLength,
                    characterUrl: snapshot
                        .data!.data.relationships.animeCharacters.links.related,
                  );
                }
            }
          },
        ),
      ),
    );
  }
}
