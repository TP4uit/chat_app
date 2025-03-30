import 'package:chat_app/features/home/presentation/widgets/details_chat_item.dart';
import 'package:chat_app/features/home/presentation/widgets/tab_header.dart';
import 'package:flutter/material.dart';

class ChatsTab extends StatelessWidget {
  const ChatsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const SizedBox(
              height: 47,
            ),
            TabHeader(
                title: 'Chat',
                trailingIcon: Row(children: [
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.chat,
                        color: Colors.white,
                      )),
                  const SizedBox(width: 6,),
                  IconButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/settings');
                      },
                      icon: const Icon(
                        Icons.settings,
                        color: Colors.white,
                      )),

                ],) ),
            const SizedBox(
              height: 22,
            ),
            _searchBar(),
            const SizedBox(
              height: 22,
            ),
            _chatList()
          ],
        ),
      ),
    );
  }

  Widget _searchBar() {
    return const TextField(
        decoration: InputDecoration(hintText: "Search for a chat..."));
  }

  Widget _chatList() {
    return Expanded(
      child: ListView.separated(
          itemBuilder: (context, index) {
            return DetailsChatItem(index: index);
          },
          separatorBuilder: (context, index) => const SizedBox(
                height: 15,
              ),
          itemCount: 20),
    );
  }
}