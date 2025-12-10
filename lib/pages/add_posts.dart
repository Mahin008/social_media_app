import 'package:flutter/material.dart';
import 'package:social_media_app/components/custom_button.dart';
import 'package:social_media_app/components/custom_text_field1.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:toast/toast.dart';
class AddPosts extends StatefulWidget {

  AddPosts({super.key});

  @override
  State<AddPosts> createState() => _AddPostsState();
}

class _AddPostsState extends State<AddPosts> {
  final postController = TextEditingController();
  bool isLoading = false;
  DatabaseReference ref = FirebaseDatabase.instance.ref("Posts");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Posts",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
        backgroundColor: Colors.purple[500],
      ),
      body: Column(
        children: [
          SizedBox(height: 20,),
          CustomTextField1(
              hintText: "What's on your mind...",
              isObscure: false, txtController: postController,
              linesNum: 4,
          ),
          SizedBox(height: 10,),
          CustomButton(
            buttonTxt: "Add Post",
            onTap: (){
              ref.child('1').set(
                {
                  'post_message': postController.text.toString()
                }
              ).then((value){
                Toast.show("Post Added",backgroundColor: Colors.green,textStyle: TextStyle(color: Colors.white,fontWeight: FontWeight.bold));
                isLoading=false;
              }).onError((error,stackTrack){
                Toast.show(error.toString());
                isLoading=false;
              });
            },
            color: Colors.purple,
          )
        ],
      ),
    );
  }
}
