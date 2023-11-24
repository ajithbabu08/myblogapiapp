import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myblogapiapp/model/posts_model.dart';

import 'blogHome.dart';


class BlogDetailsScreen extends StatelessWidget {
  Blogposts mypost;
  // final Blogposts mypost;

  BlogDetailsScreen({required this.mypost});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black26,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new, color: Colors.black),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => BlogsHomepage()));
          },
        ),

        title: Center(
            child: Text('Post Details',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 25))),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              mypost.title!,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold,color: Colors.black,),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(mypost.body!,style: TextStyle(fontSize: 17)),
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
            future: fetchComments(mypost.id!),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                    child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                List? comments = snapshot.data;
                return Expanded(
                  child: ListView.builder(
                    itemCount: comments?.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(comments?[index]['name'],style: TextStyle(color: Colors.black)),
                        subtitle: Text(comments?[index]['body'],style: TextStyle(color: Colors.black)),
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
