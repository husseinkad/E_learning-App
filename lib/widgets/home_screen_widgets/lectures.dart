import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_learning/controllers/video_data_controller.dart';
import 'package:e_learning/utils/textstyles.dart';
import 'package:e_learning/views/lecture_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

Widget lectures(title) {
  final VideoDataController videoDataController = Get.put(VideoDataController());

  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyles.bigBoldBlack,
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'See All',
                  style: TextStyles.smallGray,
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 182,
          child: Obx(
                () => videoDataController.videos.isEmpty
                ? const Center(child: CircularProgressIndicator())
                : ListView.builder(
                  itemCount: videoDataController.videos.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {

                final video = videoDataController.videos[index];

                return Container(
                  margin: const EdgeInsets.all(8.0),
                  width: 200, // Set the width of each item
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () async {
                          Get.to(LecturePage(videoModel: video));
                          },
                        child: Container(
                          width: double.infinity,
                          height: 120,
                          clipBehavior: Clip.hardEdge,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: CachedNetworkImage(
                              imageUrl: video.thumbnail,
                              placeholder: (context, url) => Container(color: Colors.grey[200],)

                        ),),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          const Icon(Icons.access_time, size: 12),
                          const SizedBox(width: 4),
                          Text(video.duration, style: TextStyles.smallBlack,),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(
                        video.title,
                        style: TextStyles.smallBlack,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ],
    ),
  );
}
