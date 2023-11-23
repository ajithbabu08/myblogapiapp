import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/posts_controller.dart';
import '../model/user_model.dart';
import 'addblog.dart';
import 'blogdetails.dart';

void main(){
  runApp(GetMaterialApp(debugShowCheckedModeBanner:false,
    home: BlogsHomepage(),));
}


class BlogsHomepage extends StatelessWidget {

  final BlogPost_Controller postController = Get.put(BlogPost_Controller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black26,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Center(
            child: Text("Blog PeN",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 25),)),



        actions: [
          Obx(() {
            return postController.userList.isEmpty
                ? CircularProgressIndicator() // or any other loading indicator
                : DropdownButton<String>(
              value: postController.selectedUser.value.name,
              icon: Icon(Icons.arrow_drop_down),
              onChanged: (String? newValue) {
                postController.setSelectedUser(newValue);
              },
              items: postController.userList.map<DropdownMenuItem<String>>((dynamic user)
              {
                return DropdownMenuItem<String>(
                  value: user.name,
                  child: Text(user.name ?? ''),
                );
              }).toList(),
            );
          }),
        ],






      ),
      body: SizedBox(child: Obx(() {
        if (postController.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        } else {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Expanded(
              child: ListView.builder(
                itemCount: postController.postList.length,
                itemBuilder: (context, index) {
                  final post = postController.postList[index];

                  return postController.selectedUser!.value.userid == post.userId?

                    GestureDetector(
                    onTap: () async {

                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return  BlogDetailsScreen(mypost: post);
                          } ,
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                      decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                      ),

                        child: ListTile(
                          title: Text(post.title!,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                          subtitle: Padding(
                            padding: const EdgeInsets.only(top: 15),
                            child: Text(post.body!,
                              style: TextStyle(fontSize: 16,color: Colors.black),
                              textAlign: TextAlign.justify,),
                          ),
                          trailing: IconButton(
                            icon: Icon(Icons.delete, color: Colors.red,),
                            onPressed: () {
                              postController.deletePost(index);

                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  backgroundColor: Colors.red,
                                  content: Text('Blog deleted successfully !'),
                                  duration: Duration(seconds: 2),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ): SizedBox();
                },
              ),
            ),
          );
        }
      })),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=> addnewBlog()));
        },
        child: Icon(Icons.add),
      ),

    );
  }
}
