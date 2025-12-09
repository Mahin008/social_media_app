import 'package:flutter/material.dart';
import 'package:social_media_app/pages/chat_page.dart';
import 'package:social_media_app/pages/feed.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex=0;
  List<Widget> bottomNavPages=[
    Feed(),
    ChatPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: bottomNavPages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey,
        onTap: (index){
          setState(() {
            _currentIndex=index;
          });
        },
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.newspaper),
              label: "Feed"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.message),
              label: "Chats"
          )
        ]
      ),
    );
  }
}
