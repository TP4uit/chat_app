import 'package:flutter/material.dart';
import '../../../../common/constants/colors.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Avatar và thông tin người dùng
            Container(
              margin: const EdgeInsets.only(bottom: 24.0),
              child: Row(
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRPg_Rpex-dL6GPOMJeXJjuMVULKAnHtjQJew&s'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Phuc Le Quang',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        '+84 889 378 933',
                        style: TextStyle(
                          color: Colors.white54,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            
            // Danh sách các liên kết settings
            _buildSettingItem(
              context,
              icon: Icons.person_outline,
              title: 'Account',
              onTap: () => Navigator.pushNamed(context, '/account'),
            ),
            _buildDivider(),
            
            _buildSettingItem(
              context,
              icon: Icons.shield_outlined,
              title: 'Privacy',
              onTap: () => Navigator.pushNamed(context, '/privacy'),
            ),
            _buildDivider(),
            
            _buildSettingItem(
              context,
              icon: Icons.notifications_none,
              title: 'Notifications',
              onTap: () => Navigator.pushNamed(context, '/notification'),
            ),
            _buildDivider(),
            
            _buildSettingItem(
              context,
              icon: Icons.brightness_medium,
              title: 'Appearance',
              onTap: () => Navigator.pushNamed(context, '/appearance'),
            ),
            _buildDivider(),
            
            _buildSettingItem(
              context,
              icon: Icons.person_add_outlined,
              title: 'Invite a Friend',
              onTap: () => Navigator.pushNamed(context, '/invite'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingItem(
    BuildContext context, {
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        child: Row(
          children: [
            Icon(
              icon,
              color: Colors.white,
              size: 24.0,
            ),
            const SizedBox(width: 16.0),
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
  
  Widget _buildDivider() {
    return const Divider(
      color: Colors.transparent,
      height: 8,
    );
  }
}