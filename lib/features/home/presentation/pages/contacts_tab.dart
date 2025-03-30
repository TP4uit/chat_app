import 'package:chat_app/features/home/presentation/widgets/basic_chat_item.dart';
import 'package:chat_app/features/home/presentation/widgets/tab_header.dart';
import 'package:flutter/material.dart';

class ContactsTab extends StatelessWidget {
  const ContactsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const SizedBox(height: 47),
            TabHeader(
                title: 'Contacts',
                trailingIcon: IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/settings');
                    },
                    icon: const Icon(
                      Icons.settings,
                      color: Colors.white,
                    ))),
            const SizedBox(
              height: 20,
            ),
            _listContacts()
          ],
        ),
      ),
    );
  }

  Widget _listContacts() {
    return Expanded(
      child: ListView.separated(
          itemBuilder: (context, index) {
            return BasicChatItem(index: index,isInContactScreen: true,);
          },
          separatorBuilder: (context, index) => const SizedBox(
                height: 15,
              ),
          itemCount: 10),
    );
  }
}