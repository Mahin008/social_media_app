import 'package:flutter/material.dart';
import 'package:social_media_app/components/custom_button.dart';
import 'package:social_media_app/components/custom_text_field1.dart';
class AddPosts extends StatelessWidget {
  final postController = TextEditingController();
  AddPosts({super.key});

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
          CustomButton(buttonTxt: "Add Post", onTap: (){},color: Colors.purple[500],)
        ],
      ),
    );
  }
}
