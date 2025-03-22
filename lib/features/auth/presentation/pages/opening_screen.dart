import 'dart:async';
import 'package:flutter/material.dart';
import '../../../../common/constants/colors.dart';

class OpeningScreen extends StatefulWidget {
  const OpeningScreen({Key? key}) : super(key: key);

  @override
  _OpeningScreenState createState() => _OpeningScreenState();
}

class _OpeningScreenState extends State<OpeningScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  
  @override
  void initState() {
    super.initState();
    
    // Tạo animation controller cho hiệu ứng quay
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat();
    
    // Tự động chuyển đến màn hình Get Started sau 3 giây
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, '/get_started');
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Text "Welcome"
            const Text(
              'Welcome',
              style: TextStyle(
                color: AppColors.secondaryTextColor,
                fontSize: 32.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            
            const SizedBox(height: 40.0),
            
            // Biểu tượng loading - vòng tròn xoay màu vàng
            AnimatedBuilder(
              animation: _controller,
              builder: (_, child) {
                return Transform.rotate(
                  angle: _controller.value * 2 * 3.14159,
                  child: Container(
                    width: 50,
                    height: 50,
                    child: const Icon(
                      Icons.refresh,
                      color: Colors.yellow,
                      size: 40,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}