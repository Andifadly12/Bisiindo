import 'package:bisiindo/models/vidio_model.dart';
import 'package:bisiindo/theme.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

/// Creates list of video players
class VideoCard extends StatefulWidget {
  final VidioModel product;
  final String picture;
  VideoCard(this.product, this.picture);
  @override
  State<VideoCard> createState() => _VideoCardState();
}

class _VideoCardState extends State<VideoCard> {
  YoutubePlayerController _controller;
  Future<void> _initializeVideoPlayerFuture;
  @override
  void initState() {
    _controller = YoutubePlayerController(
        initialVideoId: YoutubePlayer.convertUrlToId(widget.product.url),
        flags: YoutubePlayerFlags(
            //suara
            mute: false,
            autoPlay: true));
  }

  VoidCallback get listener => null;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        YoutubePlayer(controller: _controller),
        SizedBox(
          height: 15,
        ),
        Container(
          width: 365,
          height: 50,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                primary: backgroundColor1),
            onPressed: () {
              // Wrap the play or pause in a call to `setState`. This ensures the
              // correct icon is shown.
              setState(
                () {
                  // If the video is playing, pause it.
                  if (_controller.value.isPlaying) {
                    _controller.pause();
                  } else {
                    // If the video is paused, play it.
                    _controller.play();
                  }
                },
              );
            },
            // Display the correct icon depending on the state of the player.
            child: Text(
              _controller.value.isPlaying ? 'Play' : 'pause',
              style: perimaryTextStyle.copyWith(
                  fontSize: 16, fontWeight: semiBolt),
            ),
          ),
        ),
        SizedBox(
          height: 12,
        ),
        Container(
          height: 300,
          decoration: BoxDecoration(
            border: Border.all(width: 2),
            borderRadius: BorderRadius.circular(12),
            // image: DecorationImage(image: AssetImage('assets/fikom.png'))),
            image: DecorationImage(
              image: NetworkImage(widget.picture),
            ),
          ),
        )
      ],
    );
  }
}
