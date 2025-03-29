import 'package:chat_app/common/widgets/pin_code_fields.dart';
import 'package:flutter/material.dart';

class PinCodePage extends StatefulWidget {
  const PinCodePage({super.key});

  @override
  State<PinCodePage> createState() => _PinCodePageState();
}

class _PinCodePageState extends State<PinCodePage> {
  TextEditingController _pinController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Pin code',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Set pin code",style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),),
            const SizedBox(
              height: 59,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: PinCodeFields(controller: _pinController),
            ),
            const SizedBox(
              height: 32,
            ),
            _continueButton()
          ],
        ),
      ),
    );
  }

  Widget _continueButton() {
    return ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, '/confirm');
        },
        child: const Text(
          'Continue',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        ));
  }
}
