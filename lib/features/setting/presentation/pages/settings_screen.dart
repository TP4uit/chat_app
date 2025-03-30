import 'package:flutter/material.dart';
import '../../../../common/constants/colors.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

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
          'Settings',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Column(
            children: [
              // Thông tin người dùng ở đầu trang
              _buildProfileSection(),
              
              const SizedBox(height: 24.0),
              
              // Danh sách các mục cài đặt
              _buildSettingItem(
                context,
                icon: Icons.person_outline,
                title: 'Account',
                onTap: () => Navigator.pushNamed(context, '/account'),
              ),
              _buildSettingItem(
                context,
                icon: Icons.lock_outline,
                title: 'Privacy',
                onTap: () => Navigator.pushNamed(context, '/privacy'),
              ),
              _buildSettingItem(
                context,
                icon: Icons.notifications_none,
                title: 'Notifications',
                onTap: () => Navigator.pushNamed(context, '/notification'),
              ),
              _buildSettingItem(
                context,
                icon: Icons.remove_red_eye_outlined,
                title: 'Appearance',
                onTap: () => Navigator.pushNamed(context, '/appearance'),
              ),
              _buildSettingItem(
                context,
                icon: Icons.person_add_outlined,
                title: 'Invite a Friend',
                onTap: () => Navigator.pushNamed(context, '/invite'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileSection() {
    return Row(
      children: [
        // Ảnh đại diện
        CircleAvatar(
          radius: 30,
          backgroundColor: AppColors.primaryColor,
          backgroundImage: const NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRPg_Rpex-dL6GPOMJeXJjuMVULKAnHtjQJew&s'),
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.backgroundColor, width: 2),
            ),
          ),
        ),
        const SizedBox(width: 16.0),
        // Thông tin người dùng
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Phuc Le Quang',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4.0),
            Text(
              '+84 889 378 933',
              style: TextStyle(
                color: Colors.white.withOpacity(0.7),
                fontSize: 14.0,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSettingItem(
    BuildContext context, {
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(
        icon,
        color: Colors.white,
        size: 24.0,
      ),
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16.0,
        ),
      ),
      trailing: const Icon(
        Icons.arrow_forward_ios,
        color: Colors.white,
        size: 16.0,
      ),
      contentPadding: const EdgeInsets.symmetric(vertical: 8.0),
      onTap: onTap,
    );
  }
}