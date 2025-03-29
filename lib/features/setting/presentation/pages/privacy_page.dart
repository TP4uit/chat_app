import 'package:flutter/material.dart';

class PrivacyPage extends StatefulWidget {
  const PrivacyPage({super.key});

  @override
  State<PrivacyPage> createState() => _PrivacyPageState();
}

class _PrivacyPageState extends State<PrivacyPage> {
  bool isSwitch=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( leading: IconButton(
        icon: const Icon(Icons.arrow_back,color: Colors.white,),
        onPressed: () => Navigator.pop(context),
      ),
        title: const Text('Invite friend',style: TextStyle(color: Colors.white),),),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _1stLabel(),
                _1stToggle()
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _2ndLabel(),
                _2ndToggle()
              ],
            ),
          ],
        ),
      ),
    );



  }

  Widget _1stLabel()
  {
    return const Text("Allow others to see your friends list");
  }

  Widget _1stToggle()
  {
    return Switch(value: isSwitch, onChanged: (value){});
  }

  Widget _2ndLabel()
  {
    return const Text("Set pin code");
  }

  Widget _2ndToggle()
  {
    return Switch(value: isSwitch, onChanged: (value){});
  }
}
