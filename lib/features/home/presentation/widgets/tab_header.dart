import 'package:chat_app/common/constants/colors.dart';
import 'package:flutter/material.dart';

class TabHeader extends StatelessWidget {
  final String title;
  final Widget trailingIcon;
  const TabHeader({super.key, required this.title, required this.trailingIcon});

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
           Text(
            title,
            style: TextStyle(
                color: AppColors.secondaryTextColor,
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
          trailingIcon
        ],

    );
  }
}
