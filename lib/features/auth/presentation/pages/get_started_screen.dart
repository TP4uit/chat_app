import 'package:flutter/material.dart';
import '../../../../common/constants/colors.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Hình ảnh chính - 3 người đang trò chuyện
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.25,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Image.network(
                  'https://i.ibb.co/TvKwp6M/conversation.png', // Thay bằng URL của hình ảnh thực tế
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    // Fallback khi không load được hình
                    return const Center(
                      child: Icon(Icons.group, size: 80, color: Colors.grey),
                    );
                  },
                ),
              ),
              
              const SizedBox(height: 50),
              
              // Text "Join Now!!!"
              const Text(
                'Join now!!!',
                style: TextStyle(
                  color: AppColors.secondaryTextColor,
                  fontSize: 32.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              
              const SizedBox(height: 20),
              
              // Icon ngón tay chỉ xuống
              const Icon(
                Icons.arrow_downward,
                color: Colors.amber,
                size: 48.0,
              ),
              
              const SizedBox(height: 60),
              
              // Nút Get Started
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/login');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor,
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(28),
                    ),
                  ),
                  child: const Text(
                    'Get Started',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}