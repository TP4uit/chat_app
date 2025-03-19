import 'package:flutter/material.dart';
import '../../constants/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  
  // Danh sách các tab
  final List<Widget> _tabs = [
    const ChatsTab(),
    const ContactsTab(),
    const SettingsTab(),
  ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        title: const Text('Chat App'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // Hiển thị tìm kiếm
            },
          ),
        ],
      ),
      body: _tabs[_selectedIndex],
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
            icon: Icon(Icons.chat_bubble),
            label: 'Chats',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.contacts),
            label: 'Contacts',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}

// Tab hiển thị danh sách các cuộc trò chuyện
class ChatsTab extends StatelessWidget {
  const ChatsTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Dữ liệu mẫu
    final List<Map<String, dynamic>> chats = [
      {
        'name': 'Alice Johnson',
        'message': 'Hey! How are you?',
        'time': '10:30 AM',
        'unread': 2,
      },
      {
        'name': 'Bob Smith',
        'message': 'Are we still meeting tomorrow?',
        'time': 'Yesterday',
        'unread': 0,
      },
      {
        'name': 'Charlie Brown',
        'message': 'I sent you the report',
        'time': 'Yesterday',
        'unread': 0,
      },
      {
        'name': 'Diana Prince',
        'message': 'Thanks for your help!',
        'time': 'Mon',
        'unread': 1,
      },
    ];

    return ListView.builder(
      itemCount: chats.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.grey.shade800,
            child: Text(
              chats[index]['name'][0],
              style: const TextStyle(color: Colors.white),
            ),
          ),
          title: Text(
            chats[index]['name'],
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text(
            chats[index]['message'],
            style: TextStyle(
              color: Colors.grey.shade400,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                chats[index]['time'],
                style: TextStyle(
                  color: Colors.grey.shade400,
                  fontSize: 12.0,
                ),
              ),
              const SizedBox(height: 4.0),
              if (chats[index]['unread'] > 0)
                Container(
                  padding: const EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    '${chats[index]['unread']}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 10.0,
                    ),
                  ),
                ),
            ],
          ),
          onTap: () {
            Navigator.pushNamed(
              context, 
              '/chat',
              arguments: {
                'name': chats[index]['name'],
              },
            );
          },
        );
      },
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