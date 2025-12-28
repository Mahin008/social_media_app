import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:social_media_app/auth/auth_services.dart';
import 'package:social_media_app/components/custom_text_field1.dart';
import 'package:social_media_app/pages/add_posts.dart';
class Feed extends StatefulWidget {
  Feed({super.key});

  @override
  State<Feed> createState() => _FeedState();
}

class _FeedState extends State<Feed> {
  DatabaseReference ref= FirebaseDatabase.instance.ref('Posts');
  TextEditingController searchController = TextEditingController();
  TextEditingController editController = TextEditingController();
  void search(String postMessage,searchText){
    setState(() {

    });
  }
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
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.only(left: 8,right: 8),
            child: TextFormField(
              controller: searchController,
              onChanged: (String value){
                setState(() {

                });
              },
              decoration: InputDecoration(
                hintText: 'Search..',
                prefixIcon: Icon(Icons.search),
                focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.redAccent),borderRadius: BorderRadius.circular(20)),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                )
              ),
            ),
          ),
          Expanded(
            child: FirebaseAnimatedList(query: ref, itemBuilder: (context,snapshot,animation,index){
              final postMessage = snapshot.child('post_message').value.toString();
              final user_email_id = snapshot.child('user_email').value.toString();
              final post_time = snapshot.child('post_date').value.toString();
              final post_id = snapshot.child('post_id').value.toString();

              if(postMessage.toLowerCase().contains(searchController.text.toLowerCase())){
                return ListTile(

                    title: Text(postMessage,style:TextStyle(fontSize: 20),),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(user_email_id),
                        SizedBox(height: 10,),
                        Text(post_time),
                      ],
                    ),
                    trailing: PopupMenuButton(
                        icon: Icon(Icons.more_vert_outlined),
                        itemBuilder: (context)=>[
                          PopupMenuItem(
                              child: ListTile(
                                title: Text('Edit'),
                                leading: Icon(Icons.edit),
                                onTap: (){
                                  Navigator.pop(context);
                                  showMyDialog(postMessage, post_id);
                                },
                              ),
                          ),
                        ],
                    ),

                );
              } else if(searchController.text.isEmpty){
                return  ListTile(

                  title: Text(postMessage,style:TextStyle(fontSize: 20)),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(user_email_id),
                      SizedBox(height: 10,),
                      Text(post_time),
                    ],
                  ),
                  trailing: PopupMenuButton(
                    icon: Icon(Icons.more_vert_outlined),
                    itemBuilder: (context)=>[
                      PopupMenuItem(
                        child: ListTile(
                          title: Text('Edit'),
                          leading: Icon(Icons.edit),
                          onTap: (){
                            Navigator.pop(context);
                            showMyDialog(postMessage, post_id);
                          },
                        ),
                      ),
                    ],
                  ),
                );
              } else{
                return Container();
              }



            }),
          )

        ],
      ),
    );
  }
  Future<void> showMyDialog(String post_text,id)async{
    editController.text= post_text;
    return showDialog(

        context: context,
        builder: (context){
          return AlertDialog(
            title: Text('Update'),
            content: Container(
              child: TextField(
                  maxLines: 4,
                  controller: editController,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(borderSide:BorderSide(color: Colors.red)),
                    focusedBorder: OutlineInputBorder(borderSide:BorderSide(color: Colors.green)),
                  ),
              ),
            ),
            actions: [
              TextButton(
                  onPressed: (){
                    Navigator.pop(context);
                    ref.child(id).update({
                      'post_message': editController.text,
                    });
                  },
                  child: Text('Update')
              ),
              TextButton(onPressed: (){Navigator.pop(context);}, child: Text("Cancel")),
            ],
          );
        },
    );

  }
}
// Stream Builder Code to fecth data from realtime database
//Expanded(
//   child: StreamBuilder(
//       stream: ref.onValue,
//       builder: (context,snapshot){
//         if(snapshot.hasData){
//           Map<dynamic,dynamic> refMap= snapshot.data!.snapshot.value as dynamic;
//           List<dynamic> refList=[];
//           refList.clear();
//           refList= refMap.values.toList();
//           return ListView.builder(
//               itemCount: snapshot.data!.snapshot.children.length,
//               itemBuilder: (context,index){
//                 return ListTile(title: Text(refList[index]['post_message']),);
//               });
//         }else{
//           return CircularProgressIndicator(padding: EdgeInsets.only(left: 120,right: 120,top: 8,bottom: 8),);
//         }
//
//       }
//   ),
// ),
