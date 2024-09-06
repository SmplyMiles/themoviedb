import 'package:flutter/material.dart';


Drawer drawer(BuildContext context) {
  return 
    Drawer(
        child: ListView(
        padding: const EdgeInsets.all(0),
        children: [
          
          ListTile(
          leading: const Icon(Icons.movie),
          title: const Text(' Movies '),
          onTap: () {
            Navigator.pop(context);
          },
          ),
          ListTile(
          leading: const Icon(Icons.video_collection),
          title: const Text(' TV Shows '),
          onTap: () {
            Navigator.pop(context);
          },
          ),
          ListTile(
          leading: const Icon(Icons.people),
          title: const Text(' People '),
          onTap: () {
            Navigator.pop(context);
          },
          ),
          ListTile(
          leading: const Icon(Icons.book_rounded),
          title: const Text(' Contribution bible '),
          onTap: () {
            Navigator.pop(context);
          },
          ),
          ListTile(
          leading: const Icon(Icons.chat_rounded),
          title: const Text(' Discussions '),
          onTap: () {
            Navigator.pop(context);
          },
          ),
          ListTile(
          leading: const Icon(Icons.leaderboard_rounded),
          title: const Text('Leaderboard'),
          onTap: () {
            Navigator.pop(context);
          },
          ),
          ListTile(
          leading: const Icon(Icons.api_sharp),
          title: const Text('API'),
          onTap: () {
            Navigator.pop(context);
          },
          ),
          ListTile(
          leading: const Icon(Icons.support_agent_sharp),
          title: const Text('Support'),
          onTap: () {
            Navigator.pop(context);
          },
          ),
          ListTile(
          leading: const Icon(Icons.content_paste_go_sharp),
          title: const Text('About'),
          onTap: () {
            Navigator.pop(context);
          },
          ),
          ListTile(
          leading: const Icon(Icons.login_sharp),
          title: const Text('Login'),
          onTap: () {
            Navigator.pop(context);
          },
          ),
        ],
        ),
     );
}