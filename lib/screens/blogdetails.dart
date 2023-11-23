import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class BlogDetailsScreen extends StatelessWidget {
  final Map<String, dynamic> mypost;
  // final Blogposts mypost;

  BlogDetailsScreen({required this.mypost});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('Post Details'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              mypost['title'],
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Colors.blue),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(mypost['body']),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Comments:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          FutureBuilder(
            // You need to implement fetching comments logic here
            future: fetchComments(mypost['id']),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                List? comments = snapshot.data;
                return Expanded(
                  child: ListView.builder(
                    itemCount: comments?.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(comments?[index]['name']),
                        subtitle: Text(comments?[index]['body']),
                      );
                    },
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }

  Future<List<dynamic>> fetchComments(int postId) async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts/$postId/comments'));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load comments');
    }
  }
}
