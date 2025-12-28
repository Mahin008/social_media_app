import 'package:firebase_auth/firebase_auth.dart';
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
  final uid= FirebaseAuth.instance.currentUser?.uid;
  final user_email= FirebaseAuth.instance.currentUser?.email;
  Future<void> addPost(BuildContext context)async{
    setState(() {
      isLoading=true;
    });
    String id = DateTime.now().millisecondsSinceEpoch.toString();
    try{
      await ref.child(id).set({
        'user_id': uid,
        'post_id': id,
        'user_email': user_email,
        'post_message': postController.text.toString(),
        'post_date': DateTime.now().toIso8601String(),
      });
      postController.clear();
      Toast.show("Post Added");
    } catch(e){
      Toast.show(e.toString());
    } finally{
      setState(() {
        isLoading=false;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
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
            onTap: ()=>addPost(context),
            color: Colors.purple,
            isLoading: isLoading,
          )
        ],
      ),
    );
  }
}
