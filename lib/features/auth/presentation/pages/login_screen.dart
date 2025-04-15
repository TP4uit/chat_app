import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../../common/constants/colors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _phoneController = TextEditingController();
  bool _isButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    _phoneController.addListener(_validatePhoneNumber);
  }

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }

  void _validatePhoneNumber() {
    setState(() {
      _isButtonEnabled = _phoneController.text.isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
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
                    // Text "Enter your phone number"
                    const Text(
                      'Enter your phone number',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    
                    const SizedBox(height: 24.0),
                    
                    // Row containing country code and phone input
                    Row(
                      children: [
                        // Country code button
                        Container(
                          height: 56,
                          width: 70, // Fixed width for the country code
                          decoration: BoxDecoration(
                            color: Color(0xFFE0E0E0), // Light gray background
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              borderRadius: BorderRadius.circular(4),
                              onTap: () {
                                // Will implement dropdown functionality here later
                              },
                              child: Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.add,
                                      color: Colors.black87,
                                      size: 16,
                                    ),
                                    Text(
                                      '62',
                                      style: TextStyle(
                                        color: Colors.black87,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    // Space for flag can be added here later
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        
                        // Phone number input field
                        Expanded(
                          child: Container(
                            height: 56,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            margin: const EdgeInsets.only(left: 8),
                            child: TextField(
                              controller: _phoneController,
                              keyboardType: TextInputType.phone,
                              textAlign: TextAlign.left,
                              style: const TextStyle(
                                color: Colors.black87,
                                fontSize: 16,
                              ),
                              decoration: InputDecoration(
                                hintText: 'Phone Number',
                                hintStyle: TextStyle(
                                  color: Colors.grey.shade500,
                                  fontSize: 16,
                                ),
                                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
                                border: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                                filled: false,
                              ),
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    
                    const SizedBox(height: 24.0),
                    
                    // Continue button with gradient
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
                                  Navigator.pushNamed(
                                    context, 
                                    '/verification',
                                    arguments: '+62 ${_phoneController.text}',
                                  );
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