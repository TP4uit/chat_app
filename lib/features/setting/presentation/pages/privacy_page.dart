import 'package:chat_app/features/setting/presentation/widgets/switch_toggles.dart';
import 'package:flutter/material.dart';

class PrivacyPage extends StatefulWidget {
  const PrivacyPage({super.key});

  @override
  State<PrivacyPage> createState() => _PrivacyPageState();
}

class _PrivacyPageState extends State<PrivacyPage> {
  bool _isSwitch1 = false;
  bool _isSwitch2 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: Colors.white,),
        onPressed: () => Navigator.pop(context),
      ),
        title: const Text(
          'Invite friend', style: TextStyle(color: Colors.white),),),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            SwitchToggles(title: "Allow others to see your friends list",
                value: _isSwitch1,
                onChange: (value) {
                  setState(() {
                    _isSwitch1 = value;
                  });
                }),

            SizedBox(height: 16,),

            SwitchToggles(title: "Set pin code",
                value: _isSwitch2,
                onChange: (value) {
                  setState(() {
                    _isSwitch2 = value;
                  });
                }),
          ],
        ),
      ),
    );
  }
}
