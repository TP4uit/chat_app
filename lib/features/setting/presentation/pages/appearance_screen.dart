import 'package:flutter/material.dart';
import '../../../../common/constants/colors.dart';

class AppearanceScreen extends StatefulWidget {
  const AppearanceScreen({Key? key}) : super(key: key);

  @override
  _AppearanceScreenState createState() => _AppearanceScreenState();
}

class _AppearanceScreenState extends State<AppearanceScreen> {
  bool _darkMode = true;
  String _selectedFont = 'Default';
  final List<String> _availableFonts = ['Default', 'Roboto', 'Open Sans', 'Montserrat', 'Poppins'];
  
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
        title: const Text(
          'Appearance',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16.0),
            
            // Dark Mode Toggle
            _buildDarkModeOption(),
            
            const SizedBox(height: 24.0),
            
            // Font Selection
            _buildFontOption(),
            
            const SizedBox(height: 24.0),
            
            // Theme Colors
            _buildThemeColorsOption(),
            
            const SizedBox(height: 24.0),
            
            // Chat Bubble Style
            _buildChatBubbleStyleOption(),
          ],
        ),
      ),
    );
  }

  Widget _buildDarkModeOption() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(bottom: 8.0),
          child: Text(
            'Dark Mode',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        InkWell(
          onTap: () {
            setState(() {
              _darkMode = !_darkMode;
            });
          },
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
            decoration: BoxDecoration(
              color: Colors.grey.shade800,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Enable Dark Mode',
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
                  activeColor: AppColors.primaryColor,
                  activeTrackColor: AppColors.primaryColor.withOpacity(0.5),
                  inactiveThumbColor: Colors.grey,
                  inactiveTrackColor: Colors.grey.withOpacity(0.5),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildFontOption() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(bottom: 8.0),
          child: Text(
            'Font',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 16.0),
          decoration: BoxDecoration(
            color: Colors.grey.shade800,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              dropdownColor: Colors.grey.shade800,
              isExpanded: true,
              value: _selectedFont,
              icon: const Icon(Icons.arrow_drop_down, color: Colors.white),
              items: _availableFonts.map((String font) {
                return DropdownMenuItem<String>(
                  value: font,
                  child: Text(
                    font,
                    style: const TextStyle(color: Colors.white),
                  ),
                );
              }).toList(),
              onChanged: (String? newValue) {
                if (newValue != null) {
                  setState(() {
                    _selectedFont = newValue;
                  });
                }
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildThemeColorsOption() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(bottom: 8.0),
          child: Text(
            'Theme Colors',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          height: 60.0,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              _buildColorOption(AppColors.primaryColor, isSelected: true),
              _buildColorOption(Colors.blue),
              _buildColorOption(Colors.purple),
              _buildColorOption(Colors.red),
              _buildColorOption(Colors.orange),
              _buildColorOption(Colors.pink),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildColorOption(Color color, {bool isSelected = false}) {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: InkWell(
        onTap: () {
          // Handle color selection
        },
        child: Container(
          width: 50.0,
          height: 50.0,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
            border: isSelected
                ? Border.all(color: Colors.white, width: 2.0)
                : null,
          ),
          child: isSelected
              ? const Icon(Icons.check, color: Colors.white)
              : null,
        ),
      ),
    );
  }

  Widget _buildChatBubbleStyleOption() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(bottom: 8.0),
          child: Text(
            'Chat Bubble Style',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildBubbleStyleOption(
              'Rounded',
              BorderRadius.circular(20.0),
              isSelected: true,
            ),
            _buildBubbleStyleOption(
              'Square',
              BorderRadius.circular(5.0),
            ),
            _buildBubbleStyleOption(
              'Sharp',
              BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0),
                bottomLeft: Radius.circular(0.0),
                bottomRight: Radius.circular(20.0),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildBubbleStyleOption(
      String label, BorderRadius borderRadius, {bool isSelected = false}) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            // Handle chat bubble style selection
          },
          child: Container(
            width: 100.0,
            height: 50.0,
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: borderRadius,
              border: isSelected
                  ? Border.all(color: Colors.white, width: 2.0)
                  : null,
            ),
            child: const Center(
              child: Text(
                'Hey there!',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12.0,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 8.0),
        Text(
          label,
          style: TextStyle(
            color: isSelected ? AppColors.primaryColor : Colors.white,
            fontSize: 14.0,
          ),
        ),
      ],
    );
  }
}