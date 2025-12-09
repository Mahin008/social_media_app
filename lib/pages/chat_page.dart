import 'package:flutter/material.dart';
import 'package:social_media_app/auth/auth_services.dart';
class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chats"),
        leading: Icon(Icons.message,color: Colors.white,),
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
              onPressed: ()async{
                AuthServices _auth= AuthServices();
                await _auth.signOut();
              },
              icon: Icon(Icons.logout_outlined)
          )
        ],
      ),
    );
  }
}
