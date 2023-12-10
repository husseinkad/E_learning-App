import 'package:e_learning/models/video_models.dart';
import 'package:get/get.dart';

class VideoDataController extends GetxController {
  // Observable list to hold the videos
  RxList<VideoModel> videos = <VideoModel>[].obs;

  @override
  void onInit() {
    // Fetch the mock videos when the controller is initialized
    fetchMockVideos();
    super.onInit();
  }

  // Fetch mock videos and update the observable list
  void fetchMockVideos() {
    videos.assignAll(MockData.getMockVideos());
  }
}
