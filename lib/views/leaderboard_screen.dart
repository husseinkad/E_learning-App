import 'package:e_learning/controllers/user_data_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// TODO: Allow users to view their ranking among others who took the same quiz. DONE
// TODO: Show a leaderboard of the top quiz scores. DONE

class LeaderboardScreen extends StatelessWidget {
  LeaderboardScreen({super.key});
  final LeaderboardController leaderboardController = Get.put(LeaderboardController());

  @override
  Widget build(BuildContext context) {
    // Call fetchUsers() to populate the list of users
    leaderboardController.fetchUsers();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Top 10 Leaderboard'),
      ),
      body: Obx(
            () => ListView.builder(
          itemCount: leaderboardController.users.length,
          itemBuilder: (context, index) {
            final user = leaderboardController.users[index];
            final bool isCurrentUser = user.id == 6;

            return ListTile(
              tileColor: isCurrentUser ? Colors.yellow : null,
              leading: CircleAvatar(
                backgroundImage: NetworkImage(user.imageUrl),
                // Fallback image if the URL is not available
                child: user.imageUrl.isEmpty ? const Icon(Icons.person) : null,
              ),
              title: Text('${user.firstName} ${user.lastName}'),
              subtitle: Text('Score: ${user.score}'),
            );
          },
        ),
      ),
    );
  }
}