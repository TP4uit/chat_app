import 'package:chat_app/features/home/presentation/widgets/basic_chat_item.dart';
import 'package:chat_app/features/home/presentation/widgets/tab_header.dart';
import 'package:flutter/material.dart';

import '../../../../common/constants/colors.dart';

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
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: TabHeader(
                  title: 'Home',
                  trailingIcon: IconButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/settings');
                      },
                      icon: const Icon(
                        Icons.settings,
                        color: Colors.white,
                      ))),
            ),
            const SizedBox(
              height: 24,
            ),
            _myProfile(),
            _tabBar(),
            _tabBarView()
          ],
        ),
      ),
    );
  }

  Widget _myProfile() {
    return Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 100,
              width: 360,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRJH91bKbzKxdC0d9_9e_8jTcd2SIvJio5lPg&s'),
                      fit: BoxFit.cover)),
            ),
            const SizedBox(
              height: 39,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Phan Quoc Tuan",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    Text(
                      '@ystt1',
                      style: TextStyle(color: Colors.white.withOpacity(0.8)),
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    const Text('https://github.com/ystt1',
                        style: TextStyle(
                            fontSize: 12, color: AppColors.secondaryTextColor)),
                    const SizedBox(
                      height: 2,
                    ),
                    const Text(
                      'hasagi',
                      style: TextStyle(fontSize: 12),
                    ),
                  ]),
            ),
          ],
        ),
        const Positioned(
          top: 59,
          left: 16,
          child: CircleAvatar(
            radius: 35,
            backgroundImage: NetworkImage(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRPg_Rpex-dL6GPOMJeXJjuMVULKAnHtjQJew&s'),
          ),
        ),
      ],
    );
  }

  Widget _tabBar() {
    return const TabBar(
      labelColor: Colors.white,
    unselectedLabelColor: Colors.white60
    ,tabs: [
      Tab(
        text: "Contacts",
      ),
      Tab(
        text: "Group",
      ),
    ]);
  }

  Widget _tabBarView() {
    return Expanded(
      child: TabBarView(
        children: [
          Container(child: _listContacts()),
          Container(
            child: const Center(
              child: Text("2nd tab"),
            ),
          ),
        ],
      ),
    );
  }

  Widget _listContacts() {
    return ListView.separated(
        itemBuilder: (context, index) {
          return BasicChatItem(index: index);
        },
        separatorBuilder: (context, index) => const SizedBox(
              height: 10,
            ),
        itemCount: 10);
  }
}