import 'package:flutter/material.dart';
import 'package:social_media_app/auth/auth_services.dart';
class Feed extends StatelessWidget {
  const Feed({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Feed"),
        leading: Icon(Icons.newspaper,color: Colors.redAccent,),
        backgroundColor: Colors.yellow,
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
