import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../../common/constants/colors.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({Key? key}) : super(key: key);

  @override
  _VerificationScreenState createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  final List<TextEditingController> _controllers = List.generate(4, (index) => TextEditingController());
  final List<FocusNode> _focusNodes = List.generate(4, (index) => FocusNode());
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
    // Get phone number from parameters
    final phoneNumber = ModalRoute.of(context)?.settings.arguments as String? ?? '+62 812 3456 7890';

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Column(
                  children: [
                    // Title
                    const Text(
                      'Enter your verification code',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    
                    const SizedBox(height: 12),
                    
                    // Subtitle with phone number
                    Text(
                      'We have sent a verification code to\n$phoneNumber',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    
                    const SizedBox(height: 40),
                    
                    // 4 OTP input fields
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(
                        4,
                        (index) => Container(
                          width: 65,
                          height: 65,
                          decoration: BoxDecoration(
                            color: Color(0xFFCCCCCC), // Light gray as per design
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: TextField(
                            controller: _controllers[index],
                            focusNode: _focusNodes[index],
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                              filled: false,
                            ),
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(1),
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                            onChanged: (value) {
                              if (value.isNotEmpty && index < 3) {
                                FocusScope.of(context).requestFocus(_focusNodes[index + 1]);
                              }
                            },
                          ),
                        ),
                      ),
                    ),
                    
                    const SizedBox(height: 24),
                    
                    // Continue Button - with gradient
                    Container(
                      height: 50,
                      decoration: ShapeDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: _isButtonEnabled 
                              ? [const Color(0xFF448976), const Color(0xFF95EDC5)]
                              : [const Color(0xFF448976).withOpacity(0.5), const Color(0xFF95EDC5).withOpacity(0.5)],
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(25),
                          onTap: _isButtonEnabled 
                              ? () {
                                  Navigator.pushNamed(context, '/user_settings');
                                }
                              : null,
                          child: Center(
                            child: Text(
                              'Continue',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    
                    // Resend code text
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Haven't received the code? ",
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.8),
                              fontSize: 14,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              // Reset form and show snackbar
                              for (var controller in _controllers) {
                                controller.clear();
                              }
                              _focusNodes[0].requestFocus();
                              
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Verification code resent'),
                                  backgroundColor: Colors.green,
                                ),
                              );
                            },
                            child: const Text(
                              "Resend code",
                              style: TextStyle(
                                color: Color(0xFF448976),
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}