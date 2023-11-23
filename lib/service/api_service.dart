import '../model/posts_model.dart';
import 'package:http/http.dart' as http;

import '../model/user_model.dart';

class HttpService{

  static Future<List<Blogposts>> fetchPosts() async{
    var response= await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
    if(response.statusCode == 200){
      var data=response.body;
      print(data);
      return blogpostsFromJson(data);
    }
    else {
    throw Exception('Failed to load posts');
    }
  }

  static Future<void> deletePost(int? postId) async {
    var response = await http.delete(Uri.parse("https://jsonplaceholder.typicode.com/posts/$postId"));

    if (response.statusCode != 200) {
      throw Exception('Failed to delete post');
    }
  }

  static Future<List<UserBlog>> fetchUsers() async{
    var response= await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));
    if(response.statusCode == 200){
      var userdata=response.body;
      return userBlogFromJson(userdata);
    }
    else {
      throw Exception('Failed to load users');
    }
  }
}