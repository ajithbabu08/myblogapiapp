import 'package:flutter/material.dart';
import 'blogHome.dart';

class addnewBlog extends StatelessWidget {
  final title = TextEditingController();
  final description = TextEditingController();

  void saveBlog(BuildContext context) {
    print('Title: ${title.text}');
    print('Description: ${description.text}');

    final snackBar = SnackBar(
      backgroundColor: Colors.green,
      content: Text('Blog Added!'),
      duration: Duration(seconds: 3),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
    Navigator.pop(context);
  }

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
          child: Text(
            "ADD BLOG",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 25),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              if (title.text.isNotEmpty && description.text.isNotEmpty) {
                saveBlog(context);
              } else {
                final snackBar = SnackBar(
                  backgroundColor: Colors.red,
                  content: Text('Please fill all the fields'),
                  duration: Duration(seconds: 3),
                );

                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              }
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 15),
              child: Text(
                "Save",
                style: TextStyle(color: Colors.green, fontSize: 18),
              ),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              controller: title,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Interesting title",
              ),
            ),
          ),
         Padding(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: description,
                minLines: 3,
                maxLines: null,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Write your blog here...",
                ),
              ),
            ),
        ],
      ),
    );
  }
}
