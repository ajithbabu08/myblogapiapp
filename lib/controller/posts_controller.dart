import 'package:get/get.dart';
import 'package:myblogapiapp/service/api_service.dart';

class BlogPost_Controller extends GetxController {
  var isLoading = true.obs;
  // var postList = <Blogposts>[].obs;
  var postList = [].obs;

  @override
  void onInit() {
    getPosts();
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
}

