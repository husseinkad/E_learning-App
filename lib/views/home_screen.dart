import 'package:e_learning/widgets/home_screen_widgets/appbar.dart';
import 'package:e_learning/widgets/home_screen_widgets/lectures.dart';
import 'package:e_learning/widgets/home_screen_widgets/searchbar.dart';
import 'package:flutter/material.dart';

// TODO: Display a list of video lectures fetched from a predefined YouTube channel using the YouTube API (you can use mock data). DONE
// TODO: Each lecture item should show its title, thumbnail, and duration. DONE
// TODO: Implement navigation to a lecture detail page when a lecture is tapped. DONE

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // search bar takes to the search page, for future use
            searchBar(),
            // lectures widgets, I used the same data for each, easily edited for future use
            lectures('Featured'),
            lectures('Programming'),
          ],
        ),
      ),
    );
  }
}

