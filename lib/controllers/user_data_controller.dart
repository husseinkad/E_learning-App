import 'package:e_learning/models/users.dart';
import 'package:get/get.dart';


class LeaderboardController extends GetxController {
  // RxList to hold the user data
  RxList<User> users = <User>[].obs;
  int myScore = 0;

  // Fetch user data
  void fetchUsers() {
    users.assignAll([
      User(id: 1, firstName: "John", lastName: "Doe", score: 90, imageUrl: "https://t3.ftcdn.net/jpg/03/02/88/46/360_F_302884605_actpipOdPOQHDTnFtp4zg4RtlWzhOASp.jpg"),
      User(id: 2, firstName: "Jane", lastName: "Smith", score: 90, imageUrl: "https://www.betterup.com/hubfs/Blog%20Images/authentic-self-person-smiling-at-camera.jpg"),
      User(id: 3, firstName: "Alice", lastName: "Johnson", score: 40, imageUrl: "https://cdn2.psychologytoday.com/assets/styles/manual_crop_1_91_1_1528x800/public/field_blog_entry_images/2018-09/shutterstock_648907024.jpg?itok=7lrLYx-B"),
      User(id: 4, firstName: "James", lastName: "Stephen", score: 70, imageUrl: "https://upload.wikimedia.org/wikipedia/commons/0/05/MrBeast_in_2021.jpg"),
      User(id: 5, firstName: "Eva", lastName: "Williams", score: 80, imageUrl: "https://www.georgetown.edu/wp-content/uploads/2022/02/Jkramerheadshot-scaled-e1645036825432-1050x1050-c-default.jpg"),
      User(id: 6, firstName: "Moh", lastName: "Ahmed", score: myScore, imageUrl: "https://t3.ftcdn.net/jpg/02/43/12/34/360_F_243123463_zTooub557xEWABDLk0jJklDyLSGl2jrr.jpg"),
      User(id: 7, firstName: "Charlie", lastName: "Brown", score: 10, imageUrl: "https://www.tu-ilmenau.de/unionline/fileadmin/_processed_/0/0/csm_Person_Yury_Prof_Foto_AnLI_Footgrafie__2_.JPG_94f12fbf25.jpg"),
      User(id: 8, firstName: "David", lastName: "Wilson", score: 30, imageUrl: "https://neweralive.na/storage/images/2023/may/lloyd-sikeba.jpg"),
      User(id: 9, firstName: "Grace", lastName: "Davis", score: 70, imageUrl: "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8cGVyc29ufGVufDB8fDB8fHww"),
      User(id: 10, firstName: "Henry", lastName: "Miller", score: 90, imageUrl: "https://liveboldandbloom.com/wp-content/uploads/2021/09/Untitled_design_3_1.png"),

    ]);
    // Sort the users by their scores in descending order
    users.sort((a, b) => b.score.compareTo(a.score));
  }


}