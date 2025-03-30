import 'package:flutter/material.dart';
import '../../../../common/constants/colors.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  bool _messageNotifications = true;
  bool _notificationSounds = true;
  bool _callNotifications = true;
  bool _groupNotifications = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Notification',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16.0),
            
            // Các tùy chọn thông báo
            _buildSwitchItem(
              title: 'Turn message notifications',
              value: _messageNotifications,
              onChanged: (value) {
                setState(() {
                  _messageNotifications = value;
                });
              },
            ),
            
            _buildSwitchItem(
              title: 'Turn notification sounds',
              value: _notificationSounds,
              onChanged: (value) {
                setState(() {
                  _notificationSounds = value;
                });
              },
            ),
            
            _buildSwitchItem(
              title: 'Turn call notifications',
              value: _callNotifications,
              onChanged: (value) {
                setState(() {
                  _callNotifications = value;
                });
              },
            ),
            
            _buildSwitchItem(
              title: 'Turn group notifications',
              value: _groupNotifications,
              onChanged: (value) {
                setState(() {
                  _groupNotifications = value;
                });
              },
            ),
            
            const SizedBox(height: 24.0),
            
            // Tiêu đề cho phần Priority Notifications
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                'Priority Notifications',
                style: TextStyle(
                  color: AppColors.primaryColor,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            
            // Danh sách các danh mục thông báo ưu tiên
            _buildPriorityItem(
              title: 'Message Previews',
              subtitle: 'Show previews of your incoming messages',
              onTap: () {
                // Xử lý khi người dùng nhấn vào mục này
              },
            ),
            
            _buildPriorityItem(
              title: 'Do Not Disturb',
              subtitle: 'Mute notifications for a set time',
              onTap: () {
                // Xử lý khi người dùng nhấn vào mục này
              },
            ),
            
            _buildPriorityItem(
              title: 'Notification Exceptions',
              subtitle: 'Set exceptions for specific contacts',
              onTap: () {
                // Xử lý khi người dùng nhấn vào mục này
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSwitchItem({
    required String title,
    required bool value,
    required Function(bool) onChanged,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16.0,
            ),
          ),
          Switch(
            value: value,
            onChanged: onChanged,
            activeColor: AppColors.primaryColor,
            activeTrackColor: AppColors.primaryColor.withOpacity(0.5),
            inactiveThumbColor: Colors.grey,
            inactiveTrackColor: Colors.grey.withOpacity(0.5),
          ),
        ],
      ),
    );
  }

  Widget _buildPriorityItem({
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                    ),
                  ),
                  const SizedBox(height: 4.0),
                  Text(
                    subtitle,
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.7),
                      fontSize: 14.0,
                    ),
                  ),
                ],
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios,
              color: Colors.white,
              size: 16.0,
            ),
          ],
        ),
      ),
    );
  }
}