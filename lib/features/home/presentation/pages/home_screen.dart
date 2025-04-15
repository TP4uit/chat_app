import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../pages/chats_tab.dart';
import '../pages/contacts_tab.dart';
import '../pages/home_tab.dart';
import '../../../../common/constants/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _tabs = [
    const HomeTab(),
    const ChatsTab(),
    const ContactsTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // Main content
          _tabs[_selectedIndex],
          
          // Notification bell in bottom right
          Positioned(
            bottom: 60,
            right: 20,
            child: _notificationBell(),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        backgroundColor: Colors.black,
        selectedItemColor: AppColors.primaryColor,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.chat_bubble_2),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.phone),
            label: 'Call',
          ),
        ],
      ),
    );
  }

  Widget _notificationBell() {
    return Container(
      height: 45,
      width: 45,
      child: Stack(
        children: [
          IconButton(
            icon: const Icon(
              Icons.notifications,
              size: 35,
              color: Color(0xffFFC107), // Yellow color
            ),
            onPressed: () {},
          ),
          const Positioned(
            top: 0,
            right: 0,
            child: CircleAvatar(
              radius: 8,
              backgroundColor: Color(0xffF44336), // Red color
              child: Text(
                "1",
                style: TextStyle(
                  fontSize: 10,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}