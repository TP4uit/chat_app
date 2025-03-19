import 'package:chat_app/common/constants/colors.dart';
import 'package:flutter/material.dart';

class TabHeader extends StatelessWidget {
  const TabHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "Home",
            style: TextStyle(
                color: AppColors.secondaryTextColor,
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
          IconButton(onPressed: () {}, icon: const Icon(Icons.settings,color: Colors.white,)),
        ],
      ),
    );
  }
}
