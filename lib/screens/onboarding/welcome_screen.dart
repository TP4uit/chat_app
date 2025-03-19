import 'package:flutter/material.dart';
import '../../constants/colors.dart';
import '../../constants/text_styles.dart';
import '../../widgets/custom_button.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Hình ảnh minh họa
              Container(
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Image.asset(
                  'assets/images/welcome.png', 
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    // Fallback when image can't be loaded
                    return Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              color: Colors.purple,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(Icons.person, color: Colors.white),
                          ),
                          const SizedBox(width: 20),
                          Container(
                            width: 70,
                            height: 70,
                            decoration: BoxDecoration(
                              color: Colors.pink,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(Icons.chat_bubble, color: Colors.white),
                          ),
                          const SizedBox(width: 20),
                          Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              color: Colors.orange,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(Icons.lightbulb, color: Colors.white),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              
              const SizedBox(height: 60),
              
              // Văn bản "Join now!!!"
              const Text(
                'Join now!!!',
                style: TextStyle(
                  color: AppColors.secondaryTextColor,
                  fontSize: 32.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              
              const SizedBox(height: 20),
              
              // Biểu tượng ngón tay chỉ xuống
              Icon(
                Icons.arrow_downward,
                color: AppColors.accentColor,
                size: 48.0,
              ),
              
              const Spacer(),
              
              // Nút Get Started
              CustomButton(
                text: 'Get Started',
                onPressed: () {
                  Navigator.pushNamed(context, '/phone');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}