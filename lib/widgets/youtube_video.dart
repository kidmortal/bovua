import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubeVideo extends StatefulWidget {
  const YoutubeVideo({Key? key}) : super(key: key);

  @override
  State<YoutubeVideo> createState() => _YoutubeVideoState();
}

class _YoutubeVideoState extends State<YoutubeVideo> {
  List<String> playlist = ['FSRCjZ7q58w', 'hmRihdzObbg'];
  int currentIndex = 0;

  YoutubePlayerController _controller = YoutubePlayerController(
    initialVideoId: 'FSRCjZ7q58w',
    flags: YoutubePlayerFlags(
      autoPlay: true,
      mute: false,
      loop: true,
    ),
  );

  handleSkipMusic() {
    setState(() {
      currentIndex = (currentIndex + 1) % playlist.length;
      _controller.load(playlist[currentIndex]);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        YoutubePlayer(
          controller: _controller,
          showVideoProgressIndicator: true,
          onReady: () => {_controller.play()},
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () => {},
              icon: Icon(Icons.play_arrow),
            ),
            SizedBox(
              width: 10,
            ),
            IconButton(
              onPressed: handleSkipMusic,
              icon: Icon(Icons.skip_next),
            ),
          ],
        )
      ],
    );
  }
}
