import 'package:chat_app/features/home/presentation/pages/home_tab.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
    const ContactsTab(),
    const SettingsTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        _tabs[_selectedIndex],
        Positioned(
            bottom: 0,
            right: 20,
            child:
                IconButton(onPressed: () {}, icon: Icon(Icons.notifications,size: 40,color: Color(0xffFFC107),)))
      ]),
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
            icon: Icon(CupertinoIcons.house_fill),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.phone),
            label: 'Call',
          ),
        ],
      ),
    );
  }
}

// Tab hiển thị danh sách liên hệ
class ContactsTab extends StatelessWidget {
  const ContactsTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Dữ liệu mẫu
    final List<Map<String, dynamic>> contacts = [
      {'name': 'Alice Johnson', 'status': 'online'},
      {'name': 'Bob Smith', 'status': 'offline'},
      {'name': 'Charlie Brown', 'status': 'online'},
      {'name': 'Diana Prince', 'status': 'offline'},
      {'name': 'Ethan Hunt', 'status': 'online'},
      {'name': 'Fiona Gallagher', 'status': 'offline'},
      {'name': 'George Miller', 'status': 'online'},
    ];

    return ListView.builder(
      itemCount: contacts.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.grey.shade800,
            child: Text(
              contacts[index]['name'][0],
              style: const TextStyle(color: Colors.white),
            ),
          ),
          title: Text(
            contacts[index]['name'],
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          trailing: Container(
            width: 10.0,
            height: 10.0,
            decoration: BoxDecoration(
              color: contacts[index]['status'] == 'online'
                  ? Colors.green
                  : Colors.grey,
              shape: BoxShape.circle,
            ),
          ),
          onTap: () {
            Navigator.pushNamed(
              context,
              '/chat',
              arguments: {
                'name': contacts[index]['name'],
              },
            );
          },
        );
      },
    );
  }
}

// Tab hiển thị cài đặt
class SettingsTab extends StatelessWidget {
  const SettingsTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> settings = [
      {
        'title': 'Account',
        'icon': Icons.person,
        'items': ['Profile', 'Privacy', 'Security'],
      },
      {
        'title': 'Chats',
        'icon': Icons.chat_bubble,
        'items': ['Theme', 'Wallpaper', 'Chat history'],
      },
      {
        'title': 'Notifications',
        'icon': Icons.notifications,
        'items': ['Message', 'Groups', 'Calls'],
      },
      {
        'title': 'Help',
        'icon': Icons.help,
        'items': ['FAQ', 'Contact us', 'Terms and Privacy Policy'],
      },
    ];

    return ListView.builder(
      itemCount: settings.length,
      itemBuilder: (context, index) {
        return ExpansionTile(
          leading: Icon(
            settings[index]['icon'],
            color: AppColors.primaryColor,
          ),
          title: Text(
            settings[index]['title'],
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          iconColor: Colors.white,
          collapsedIconColor: Colors.white,
          children: (settings[index]['items'] as List<String>).map((item) {
            return ListTile(
              contentPadding: const EdgeInsets.only(left: 72.0, right: 16.0),
              title: Text(
                item,
                style: const TextStyle(color: Colors.white),
              ),
              onTap: () {
                // Xử lý khi nhấn vào các mục cài đặt
              },
            );
          }).toList(),
        );
      },
    );
  }
}
