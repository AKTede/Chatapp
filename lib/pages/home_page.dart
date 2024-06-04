import 'package:chat_app_test/components/my_drawer.dart';
import 'package:chat_app_test/components/user_tile.dart';
import 'package:chat_app_test/pages/chat_page.dart';
import 'package:chat_app_test/services/auth/auth_service.dart';
import 'package:chat_app_test/services/chat/chat_service.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  //chat & auth service
  final ChatService _chatService = ChatService();
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: const Text('Accueil'),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.grey,
        elevation: 0,
      ),
      drawer: const MyDrawer(),
      body: _buildUserList(),
      );
    } 
  //build a list of users except for the current logged in user
  Widget _buildUserList() {
    return StreamBuilder(
      stream: _chatService.getUsersStream(), 
      builder: (context, snapshot) {
        //error
        if (snapshot.hasError) {
          return const Text("Erreur");
        }
        //loading..
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text("Chargement...");
        }
        //list view
        return ListView(
          children: snapshot.data!.map<Widget>((userData) => _buildUserListItem(userData, context)).toList(),
        );
      },
    );
  }
  //build individual list tile for user
  Widget _buildUserListItem(Map<String, dynamic> userData, BuildContext context) {
    //display all users except current user
    if(userData["email"] != _authService.getCurrentUser()!.email) {
      return UserTile(
        text: userData["email"],
        onTap: () {
          //tapped on a user -> go to chat page
          Navigator.push(context, MaterialPageRoute(
            builder: (context) => ChatPage(
              receiverEmail: userData["email"],
              receiverID: userData["uid"],
            ),)
          );
        },
      );
    }
    else {
      return Container();
    }
  }
}