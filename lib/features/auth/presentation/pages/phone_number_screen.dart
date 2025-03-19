import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../common/constants/colors.dart';
import '../../../../common/constants/text_styles.dart';
import '../../../../common/widgets/custom_button.dart';
import '../../../../common/widgets/custom_text_field.dart';


class PhoneNumberScreen extends StatefulWidget {
  const PhoneNumberScreen({Key? key}) : super(key: key);

  @override
  _PhoneNumberScreenState createState() => _PhoneNumberScreenState();
}

class _PhoneNumberScreenState extends State<PhoneNumberScreen> {
  final TextEditingController _phoneController = TextEditingController();
  final String _selectedCountryCode = '+62'; // Mã quốc gia Indonesia
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
      _isButtonEnabled = _phoneController.text.length >= 8;
    });
  }

  @override
  Widget build(BuildContext context) {
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40.0),
              
              // Tiêu đề
              const Text(
                'Enter your phone number',
                style: AppTextStyles.headline,
              ),
              
              const SizedBox(height: 40.0),
              
              // Input số điện thoại
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Country code button
                  Container(
                    height: 56,
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Center(
                      child: Text(
                        _selectedCountryCode,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                  ),
                  
                  const SizedBox(width: 8.0),
                  
                  // Phone number field
                  Expanded(
                    child: CustomTextField(
                      hintText: 'Phone Number',
                      controller: _phoneController,
                      keyboardType: TextInputType.phone,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                    ),
                  ),
                ],
              ),
              
              const Spacer(),
              
              // Nút Continue
              CustomButton(
                text: 'Continue',
                onPressed: () {
                  if (_isButtonEnabled) {
                    Navigator.pushNamed(
                      context, 
                      '/verification', 
                      arguments: '$_selectedCountryCode ${_phoneController.text}'
                    );
                  }
                },
                isEnabled: _isButtonEnabled,
              ),
              
              const SizedBox(height: 20.0),
            ],
          ),
        ),
      ),
    );
  }
}