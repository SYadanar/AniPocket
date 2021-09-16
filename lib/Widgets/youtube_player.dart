import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YouTubePlayer extends StatelessWidget {
  final String youtubeVideoId;
  YouTubePlayer(this.youtubeVideoId, {Key? key}) : super(key: key);

  // https://www.youtube.com/watch?v=<<YOUTUBE_VIDEO_ID>>

  @override
  Widget build(BuildContext context) {
    return Container(
      child: YoutubePlayer(
        controller: YoutubePlayerController(
          initialVideoId: youtubeVideoId,
          flags: YoutubePlayerFlags(autoPlay: false, mute: false),
        ),
        liveUIColor: Colors.amber,
      ),
    );
  }
}
