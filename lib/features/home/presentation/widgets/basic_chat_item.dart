import 'package:flutter/material.dart';
import '../../../../common/constants/colors.dart';

class BasicChatItem extends StatelessWidget {
  final int index;
  final bool isInContactScreen;
  const BasicChatItem({super.key, required this.index, this.isInContactScreen = false});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Khi người dùng nhấn vào item, chuyển đến màn hình chat riêng
        Navigator.pushNamed(
          context,
          '/person_chat',
          arguments: {
            'name': 'User $index',
            'avatarUrl': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRPg_Rpex-dL6GPOMJeXJjuMVULKAnHtjQJew&s',
          },
        );
      },
      child: ListTile(
        leading: CircleAvatar(
          radius: isInContactScreen ? 25 : 20,
          backgroundImage: const NetworkImage(
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRPg_Rpex-dL6GPOMJeXJjuMVULKAnHtjQJew&s'),
        ),
        title: Text(
          "User $index",
          style: TextStyle(
              color: isInContactScreen ? AppColors.secondaryTextColor : Colors.white,
              fontSize: isInContactScreen ? 16 : 14),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Text(
          "Message $index aaaaaaaaaaaaaaaaaaaaa aaaaaaaaaaaa",
          style: TextStyle(color: Colors.white.withOpacity(0.6), fontSize: 12),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}