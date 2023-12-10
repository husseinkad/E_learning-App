class VideoModel {
  final String title;
  final String thumbnail;
  final String description;
  final String duration; // Representing duration as a string
  final String videoId;

  VideoModel({
    required this.title,
    required this.thumbnail,
    required this.description,
    required this.duration,
    required this.videoId,
  });
}

class MockData {
  static List<VideoModel> getMockVideos() {
    return [
      VideoModel(
        title: 'Learn JavaScript - Full Course for Beginners',
        thumbnail: 'https://i.ytimg.com/vi/PkZNo7MFNFg/maxresdefault.jpg',
        description: 'This complete 134-part JavaScript tutorial for beginners will teach you everything you need to know to get started with the JavaScript programming language.',
        duration: '3:26:42',
        videoId: 'PkZNo7MFNFg',
      ),
      VideoModel(
        title: 'Learn React JS - Full Course for Beginners - Tutorial 2019',
        thumbnail: 'https://i.ytimg.com/vi/DLX62G4lc44/maxresdefault.jpg',
        description: 'React.js is a JavaScript library for building dynamic web applications. Upon completion of this course, you\'ll know everything you need in order to build web applications in React.',
        duration: '5:05:33',
        videoId: 'DLX62G4lc44',
      ),
      VideoModel(
        title: 'Learn Python - Full Course for Beginners [Tutorial]',
        thumbnail: 'https://i.ytimg.com/vi/rfscVS0vtbw/maxresdefault.jpg',
        description: 'This course will give you a full introduction into all of the core concepts in python. Follow along with the videos and you\'ll be a python programmer in no time!',
        duration: '4:26:51',
        videoId: 'rfscVS0vtbw',
      ),
      VideoModel(
        title: 'Python Django Web Framework - Full Course for Beginners',
        thumbnail: 'https://i.ytimg.com/vi/F5mRW0jo-U4/hq720.jpg?sqp=-oaymwEhCK4FEIIDSFryq4qpAxMIARUAAAAAGAElAADIQj0AgKJD&rs=AOn4CLDIbhA9yoWgP5_OiPhm-2SmhAbKAg',
        description: 'Learn the Python Django framework with this free full course. Django is an extremely popular and fully featured server-side web framework, written in Python. Django allows you to quickly create web apps',
        duration: '3:45:40',
        videoId: 'F5mRW0jo-U4',
      ),
    ];
  }
}
