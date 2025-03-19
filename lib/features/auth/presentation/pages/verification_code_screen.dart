import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../common/constants/colors.dart';
import '../../../../common/constants/text_styles.dart';
import '../../../../common/widgets/custom_button.dart';

class VerificationCodeScreen extends StatefulWidget {
  const VerificationCodeScreen({Key? key}) : super(key: key);

  @override
  _VerificationCodeScreenState createState() => _VerificationCodeScreenState();
}

class _VerificationCodeScreenState extends State<VerificationCodeScreen> {
  final List<TextEditingController> _controllers = List.generate(
    4, 
    (index) => TextEditingController()
  );
  
  final List<FocusNode> _focusNodes = List.generate(
    4, 
    (index) => FocusNode()
  );
  
  bool _isButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    for (var i = 0; i < _controllers.length; i++) {
      _controllers[i].addListener(() {
        _checkFieldsComplete();
      });
    }
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var node in _focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  void _checkFieldsComplete() {
    bool allFilled = true;
    for (var controller in _controllers) {
      if (controller.text.isEmpty) {
        allFilled = false;
        break;
      }
    }
    setState(() {
      _isButtonEnabled = allFilled;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Lấy số điện thoại từ tham số được truyền vào
    final phoneNumber = ModalRoute.of(context)?.settings.arguments as String? ?? '+62 812 3456 7890';

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 40.0),
              
              // Tiêu đề
              const Text(
                'Enter your verification code',
                style: AppTextStyles.headline,
                textAlign: TextAlign.center,
              ),
              
              const SizedBox(height: 20.0),
              
              // Subtitle với số điện thoại
              Text(
                'We have sent a verification code to\n$phoneNumber',
                style: AppTextStyles.subheadline,
                textAlign: TextAlign.center,
              ),
              
              const SizedBox(height: 40.0),
              
              // Trường nhập mã xác minh
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(
                  4,
                  (index) => SizedBox(
                    width: 60.0,
                    height: 60.0,
                    child: TextField(
                      controller: _controllers[index],
                      focusNode: _focusNodes[index],
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      maxLength: 1,
                      style: const TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      decoration: InputDecoration(
                        counterText: '',
                        filled: true,
                        fillColor: Colors.grey.shade700,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      onChanged: (value) {
                        if (value.isNotEmpty && index < 3) {
                          _focusNodes[index + 1].requestFocus();
                        }
                      },
                    ),
                  ),
                ),
              ),
              
              const Spacer(),
              
              // Nút Continue
              CustomButton(
                text: 'Continue',
                onPressed: () {
                  if (_isButtonEnabled) {
                    Navigator.pushNamed(context, '/create_profile');
                  }
                },
                isEnabled: _isButtonEnabled,
              ),
              
              const SizedBox(height: 10.0),
              
              // Nút Resend code
              TextButton(
                onPressed: () {
                  // Reset các trường nhập liệu
                  for (var controller in _controllers) {
                    controller.clear();
                  }
                  _focusNodes[0].requestFocus();
                  
                  // Hiển thị thông báo
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Verification code resent'),
                      duration: Duration(seconds: 2),
                    ),
                  );
                },
                child: const Text(
                  'Haven\'t received the code? Resend code',
                  style: TextStyle(
                    color: AppColors.primaryColor,
                    fontSize: 14.0,
                  ),
                ),
              ),
              
              const SizedBox(height: 20.0),
            ],
          ),
        ),
      ),
    );
  }
}