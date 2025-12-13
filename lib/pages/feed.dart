import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:social_media_app/auth/auth_services.dart';
import 'package:social_media_app/pages/add_posts.dart';
class Feed extends StatelessWidget {
  Feed({super.key});
  DatabaseReference ref= FirebaseDatabase.instance.ref('Posts');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Feed",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
        leading: Icon(Icons.newspaper,color: Colors.white,),
        backgroundColor: Colors.redAccent[400],
        actions: [
          IconButton(
              onPressed: ()async{
                AuthServices _auth= AuthServices();
                await _auth.signOut();
              },
              icon: Icon(Icons.logout_outlined,color: Colors.white,)
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.purple[500],
          child: Icon(Icons.add,color: Colors.white,),
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>AddPosts()));
          }
      ),
      body: Column(
        children: [
          Expanded(
            child: FirebaseAnimatedList(query: ref, itemBuilder: (context,snapshot,animation,index){
              return ListTile(
                title: Text(snapshot.child('post_message').value.toString())
              );
            }),
          )

        ],
      ),
    );
  }
}
