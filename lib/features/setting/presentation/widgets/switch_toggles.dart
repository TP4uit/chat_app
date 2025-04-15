import 'package:flutter/material.dart';

class SwitchToggles extends StatelessWidget {
  final String title;
  final bool value;
  final Function(bool) onChange;
  const SwitchToggles({super.key, required this.title, required this.value, required this.onChange});

  @override
  Widget build(BuildContext context) {

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16.0,
          ),
        ),
        _buildToggleSwitch(value,onChange),
      ],
    );

  }


  Widget _buildToggleSwitch(bool value,Function(bool) onChanged) {
    return GestureDetector(
      onTap: () => onChanged(!value),
      child: Container(
        width: 51,
        height: 31,
        clipBehavior: Clip.antiAlias,
        decoration: ShapeDecoration(
          color: value ? const Color(0xFF34C759) : Colors.grey,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              left: value ? 22 : 2,
              top: 2,
              child: Container(
                width: 27,
                height: 27,
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                  shadows: const [
                    BoxShadow(
                      color: Color(0x0F000000),
                      blurRadius: 1,
                      offset: Offset(0, 3),
                      spreadRadius: 0,
                    ),
                    BoxShadow(
                      color: Color(0x26000000),
                      blurRadius: 8,
                      offset: Offset(0, 3),
                      spreadRadius: 0,
                    ),
                    BoxShadow(
                      color: Color(0x0A000000),
                      blurRadius: 0,
                      offset: Offset(0, 0),
                      spreadRadius: 1,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
