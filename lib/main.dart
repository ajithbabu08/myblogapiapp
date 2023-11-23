import 'package:flutter/material.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
      title: 'Blog Management App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyApp(),
    );
  }
}
//
// class BlogListScreen extends StatefulWidget {
//   @override
//   _BlogListScreenState createState() => _BlogListScreenState();
// }
//
// class _BlogListScreenState extends State<BlogListScreen> {
//   List<Map<String, dynamic>> posts = [];
//   List<String> users = [];
//   // late String selectedUser='';
//
//   @override
//   void initState() {
//     super.initState();
//     fetchData();
//   }
//
//   Future<void> fetchData() async {
//     final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
//     final usersResponse = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
//
//     if (response.statusCode == 200 && usersResponse.statusCode == 200) {
//       setState(() {
//         posts = List<Map<String, dynamic>>.from(json.decode(response.body));
//         users = List<String>.from(json.decode(usersResponse.body).map((user) => user['name']));
//       });
//     } else {
//       throw Exception('Failed to load data');
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(backgroundColor: Colors.red,
//         title: Text('Blog It'),
//       ),
//       body: Column(
//         children: [
//
//           // /remove
//           // DropdownButton(
//           //   value: selectedUser,
//           //   items: users.map((user) {
//           //     return DropdownMenuItem(
//           //       value: user,
//           //       child: Text(user),
//           //     );
//           //   }).toList(),
//           //   onChanged: (value) {
//           //     setState(() {
//           //       selectedUser = value!;
//           //     });
//           //   },
//           // ),
//           // /remove
//
//           Expanded(
//             child: ListView.builder(
//               itemCount: posts.length,
//               itemBuilder: (context, index) {
//                 final post = posts[index];
//                 {
//                   return GestureDetector(
//                     onTap: () async {
//                       await Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => BlogDetailsScreen(post: post),
//                         ),
//                       );
//                     },
//
//                     child: ListTile(
//                       // leading: fetchImages(post['id']),
//                       title: Text(post['title'],
//                         style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22),textAlign: TextAlign.justify,),
//                       subtitle: Text(post['body'],
//                         style: TextStyle(fontSize: 20),textAlign: TextAlign.justify,),
//                       trailing: IconButton(
//                         icon: Icon(Icons.delete,color: Colors.red,),
//                         onPressed: () {
//                           // Implement delete functionality
//                           // You might want to show a confirmation dialog
//                           setState(() {
//                             posts.removeAt(index);
//                           });
//                         },
//                       ),
//                     ),
//                   );
//                 }
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
// //   /remove
// //   fetchImages(int postId) async{
// //     final response= await http.get(Uri.parse("https://jsonplaceholder.typicode.com/albums"));
// //   }
// // }
// //
// //
// // Future<List<dynamic>> fetchComments(int postId) async {
// //   final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts/$postId/comments'));
// //
// //   if (response.statusCode == 200) {
// //     return json.decode(response.body);
// //   } else {
// //     throw Exception('Failed to load comments');
// //   }
// //
// // /remove
//
// }
//
//
// class BlogDetailsScreen extends StatelessWidget {
//   final Map<String, dynamic> post;
//
//   BlogDetailsScreen({required this.post});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.red,
//         title: Text('Post Details'),
//       ),
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Text(
//               post['title'],
//               style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Colors.blue),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Text(post['body']),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Text(
//               'Comments:',
//               style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//             ),
//           ),
//           FutureBuilder(
//             // You need to implement fetching comments logic here
//             future: fetchComments(post['id']),
//             builder: (context, snapshot) {
//               if (snapshot.connectionState == ConnectionState.waiting) {
//                 return CircularProgressIndicator();
//               } else if (snapshot.hasError) {
//                 return Text('Error: ${snapshot.error}');
//               } else {
//                 List? comments = snapshot.data;
//                 return Expanded(
//                   child: ListView.builder(
//                     itemCount: comments?.length,
//                     itemBuilder: (context, index) {
//                       return ListTile(
//                         title: Text(comments?[index]['name']),
//                         subtitle: Text(comments?[index]['body']),
//                       );
//                     },
//                   ),
//                 );
//               }
//             },
//           ),
//         ],
//       ),
//     );
//   }
//
//   Future<List<dynamic>> fetchComments(int postId) async {
//     final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts/$postId/comments'));
//
//     if (response.statusCode == 200) {
//       return json.decode(response.body);
//     } else {
//       throw Exception('Failed to load comments');
//     }
//   }
// }
//
// class AddBlogPostScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Add Blog Post'),
//       ),
//       body: Center(
//         child: Text('Add Blog Post Screen'),
//       ),
//     );
//   }
// }