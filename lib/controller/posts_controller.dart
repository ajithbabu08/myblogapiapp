import 'package:get/get.dart';
import 'package:myblogapiapp/service/api_service.dart';

import '../model/user_model.dart';

class BlogPost_Controller extends GetxController {
  var isLoading = true.obs;
  // var postList = <Blogposts>[].obs;
  var postList = [].obs;

  var userList=[].obs;

  ///dropdown
  var selectedUser = UserBlog().obs;


  @override
  void onInit() {
    getPosts();
    ///
    getUsers();
    super.onInit();
  }

  void getPosts() async {
    try {
      isLoading(true);
      var posts = await HttpService.fetchPosts();

      if (posts != null) {
        postList.assignAll(posts);
      }
    } catch (e) {
      print(e);
    } finally {
      isLoading(false);
    }
  }

  void deletePost(int index) async {
    try {
      var postId = postList[index].id;
      await HttpService.deletePost(postId);
      postList.removeAt(index);
    } catch (e) {
      print(e);
    }
  }


  void getUsers() async {
    try {
      var users = await HttpService.fetchUsers();
      if (users != null) {
        userList.value = users;
        ///
        selectedUser.value = users.first;
      }
    } catch (e) {
      print(e);
    }
  }

  void setSelectedUser(String? userName) {
    if (userName != null) {
      selectedUser.value = userList.firstWhere((user) => user.name == userName);
      // Fetch blog posts for the selected user
      // Implement this method based on your API or data structure
      // Example: fetchPostsForUser(selectedUser.value.id);
    }
  }

}

