import 'package:flutter/material.dart';
import '../widgets/basic_chat_item.dart';

import '../../../../common/constants/colors.dart';
import '../widgets/tab_header.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const SizedBox(
              height: 47,
            ),
            TabHeader(
                title: 'Home',
                trailingIcon: Row(children: [

                  IconButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/settings');
                      },
                      icon: const Icon(
                        Icons.settings,
                        color: Colors.white,
                      )),

                ],) ),
            SizedBox(height: 18,),
            _myProfile(),
            // Tab bar (Contacts/Groups)
            Container(
              child: const TabBar(
                labelColor: Colors.white,
                unselectedLabelColor: Colors.grey,
                tabs: [
                  Tab(text: "Contacts"),
                  Tab(text: "Groups"),
                ],
              ),
            ),

            // Tab bar view (contact list)
            Expanded(
              child: TabBarView(
                children: [
                  _listContacts(),
                  Container(
                    child: const Center(
                      child: Text("No groups", style: TextStyle(color: Colors.grey)),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _myProfile() {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Banner image
            Container(
              height: 100,
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRJH91bKbzKxdC0d9_9e_8jTcd2SIvJio5lPg&s'
                  ),
                  fit: BoxFit.cover
                )
              ),
            ),
            
            // Space for profile info
            const SizedBox(height: 30),
            
            // Profile information
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Phan Quoc Tuan", // Keeping original content
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    '@ystt1', // Keeping original content
                    style: TextStyle(color: Colors.white.withOpacity(0.8)),
                  ),
                  const SizedBox(height: 2),
                  const Text(
                    'https://github.com/ystt1', // Keeping original content
                    style: TextStyle(fontSize: 12, color: AppColors.secondaryTextColor)
                  ),
                  const SizedBox(height: 2),
                  const Text(
                    'hasagi', // Keeping original content
                    style: TextStyle(fontSize: 12),
                  ),
                ],
              ),
            ),
          ],
        ),
        
        // Profile avatar
        const Positioned(
          top: 60, // Position it to overlap the banner and info area
          left: 16,
          child: CircleAvatar(
            radius: 35,
            backgroundImage: NetworkImage(
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRPg_Rpex-dL6GPOMJeXJjuMVULKAnHtjQJew&s'
            ),
          ),
        ),
      ],
    );
  }

  Widget _listContacts() {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(vertical: 10),
      itemBuilder: (context, index) {
        return BasicChatItem(index: index);
      },
      separatorBuilder: (context, index) => const SizedBox(
        height: 10,
      ),
      itemCount: 10 // Keeping original count
    );
  }
}