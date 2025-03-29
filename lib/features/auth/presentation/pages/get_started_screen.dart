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
                // Thay đổi từ Image.network sang Image.asset
                child: Image.asset(
                  'assets/Get_start_image.png', // Sử dụng ảnh từ thư mục assets
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
              
              // Text "Join Now!!!" với màu xanh mint/teal
              const SizedBox(
                width: 358,
                height: 60,
                child: Text(
                  'Join now!!!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: const Color(0xFF428875),
                    fontSize: 40,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w700,
                    height: 0.55,
                    letterSpacing: -0.41,
                  ),
                ),
              ),
              
              const SizedBox(height: 20),
              
              // Thay Icon thành hình ảnh ngón tay trỏ xuống từ assets
              Image.asset(
                'assets/image_1.png', // Sử dụng hình ngón tay từ assets
                height: 48.0,
                width: 48.0,
              ),
              
              const SizedBox(height: 60),
              
              // Nút Get Started với gradient từ Figma
              Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/login');
                  },
                  child: Container(
                    width: 280,
                    height: 50,
                    child: Stack(
                      children: [
                        Positioned(
                          left: 0,
                          top: 0,
                          child: Container(
                            width: 280,
                            height: 50,
                            decoration: ShapeDecoration(
                              gradient: LinearGradient(
                                begin: Alignment(-0.00, 0.50),
                                end: Alignment(1.00, 0.50),
                                colors: [const Color(0xFF448976), const Color(0xFF95EDC5)],
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 84,
                          top: 14,
                          child: Text(
                            'Get Started',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                              height: 1.10,
                              letterSpacing: -0.41,
                            ),
                          ),
                        ),
                      ],
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