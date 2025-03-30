import 'package:flutter/material.dart';

class AppearanceScreen extends StatefulWidget {
  const AppearanceScreen({Key? key}) : super(key: key);

  @override
  _AppearanceScreenState createState() => _AppearanceScreenState();
}

class _AppearanceScreenState extends State<AppearanceScreen> {
  bool _darkMode = true;
  String _selectedFont = 'Default';
  final List<String> _fonts = ['Default', 'Roboto', 'Open Sans', 'Montserrat'];
  
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
        title: const Text(
          'Appearance',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Dark Mode with switch
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Dark Mode',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                  ),
                ),
                Switch(
                  value: _darkMode,
                  onChanged: (value) {
                    setState(() {
                      _darkMode = value;
                    });
                  },
                  activeColor: Colors.white,
                  activeTrackColor: Colors.green,
                  inactiveThumbColor: Colors.white,
                  inactiveTrackColor: Colors.grey.shade800,
                ),
              ],
            ),
            
            const SizedBox(height: 20.0),
            
            // Font with PopupMenuButton
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Font',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                  ),
                ),
                PopupMenuButton<String>(
                  color: Colors.grey.shade900,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  offset: const Offset(-20, 0),
                  child: Row(
                    children: [
                      Text(
                        _selectedFont,
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 16.0,
                        ),
                      ),
                      const Icon(
                        Icons.arrow_drop_down,
                        color: Colors.white,
                      ),
                    ],
                  ),
                  onSelected: (String value) {
                    setState(() {
                      _selectedFont = value;
                    });
                  },
                  itemBuilder: (BuildContext context) {
                    return _fonts.map((String choice) {
                      return PopupMenuItem<String>(
                        value: choice,
                        child: Text(
                          choice,
                          style: const TextStyle(color: Colors.white),
                        ),
                      );
                    }).toList();
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}