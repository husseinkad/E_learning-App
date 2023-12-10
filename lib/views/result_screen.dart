import 'package:e_learning/controllers/quiz_controller.dart';
import 'package:e_learning/controllers/user_data_controller.dart';
import 'package:e_learning/views/home_screen.dart';
import 'package:e_learning/views/leaderboard_screen.dart';
import 'package:e_learning/widgets/quiz_screen_widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class ResultScreen extends StatelessWidget {
  ResultScreen({Key? key}) : super(key: key);

  final LeaderboardController leaderboardController = Get.put(LeaderboardController());


  @override
  Widget build(BuildContext context) {
    Get.put(QuizController());
    return Scaffold(
        body: Stack(
          children: [
            Center(
              child: GetBuilder<QuizController>(
                init: Get.find<QuizController>(),
                builder: (controller) {
                  leaderboardController.myScore = controller.scoreResult.round();
                  return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Congratulation',
                      style: Theme.of(context).textTheme.displaySmall!.copyWith(
                        color: Colors.black54,
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Text(
                      'Moh Ahmed',
                      style: Theme.of(context).textTheme.displaySmall!
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Text(
                      'Your Score is',
                      style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                        color: Colors.black54,
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Text(
                      '${controller.scoreResult.round()} /100',
                      style: Theme.of(context).textTheme.displaySmall!
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          CustomButton(
                              onPressed: () => Get.to(HomeScreen()),
                              text: 'Get Home'),
                          CustomButton(
                              onPressed: () => Get.to(LeaderboardScreen()),
                              text: 'Leaderboard'),
                        ],
                      ),
                    ),
                  ],
                );
                },
              ),
            ),
          ],
        ));
  }
}