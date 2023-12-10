import 'package:e_learning/controllers/quiz_controller.dart';
import 'package:e_learning/controllers/user_data_controller.dart';
import 'package:e_learning/controllers/youtube_player_controller.dart';
import 'package:e_learning/models/video_models.dart';
import 'package:e_learning/utils/textstyles.dart';
import 'package:e_learning/views/leaderboard_screen.dart';
import 'package:e_learning/views/quiz_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class LecturePage extends StatelessWidget {
  final VideoModel videoModel;

  LecturePage({
    required this.videoModel,
  });

  @override
  Widget build(BuildContext context) {
    final LeaderboardController leaderboardController = Get.put(
        LeaderboardController());
    final VideoPlayerController _videoPlayerController = Get.put(
        VideoPlayerController());

    _videoPlayerController.initialize(videoModel.videoId);

    return Scaffold(
      appBar: AppBar(
        title: Text('Lecture Details', style: TextStyles.bigBlack,),
        actions: [
          GestureDetector(
            onTap: () {
              _videoPlayerController.controller.pause();
              // Navigate to the leaderboard page
              Get.to(LeaderboardScreen());
            },
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  const Icon(Icons.star,),
                  const SizedBox(width: 4),
                  Text(
                    '${leaderboardController.myScore}',
                    style: TextStyles.bigBlack,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            YoutubePlayer(
              controller: _videoPlayerController.controller,
              aspectRatio: 16 / 9,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    videoModel.title,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Time: ${videoModel.duration}',
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Description: ${videoModel.description}',
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            GestureDetector(
              onTap: () {
                _videoPlayerController.controller.pause();
                Get.to(LeaderboardScreen());
              },
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Leaderboard Page',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 2),
                ],
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                _videoPlayerController.controller.pause();
                Get.to(const QuizScreen());
                Get.find<QuizController>().startTimer();
              },
              child: const Text('Take Quiz'),
            ),
          ],
        ),
      ),
    );
  }
}
