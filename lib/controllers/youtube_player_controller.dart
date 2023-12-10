import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPlayerController extends GetxController {
  late YoutubePlayerController _controller;

  void initialize(String videoId) {
    _controller = YoutubePlayerController(
      initialVideoId: videoId,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    );
  }

  YoutubePlayerController get controller => _controller;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
