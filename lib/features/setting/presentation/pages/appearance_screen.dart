import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:chat_app/main.dart'; // Đường dẫn chính xác

class AppearanceScreen extends StatefulWidget {
  const AppearanceScreen({Key? key}) : super(key: key);

  @override
  _AppearanceScreenState createState() => _AppearanceScreenState();
}

class _AppearanceScreenState extends State<AppearanceScreen> {
  bool _darkMode = true;
  String _selectedFont = 'Default';
  
  // Danh sách font bao gồm cả MJ-Megants
  final List<String> _fontOptions = [
    'Default',
    'Roboto',
    'MJ-Megants'
  ];
  
  @override
  void initState() {
    super.initState();
    _loadSavedFont();
  }
  
  // Tải font đã lưu từ SharedPreferences
  Future<void> _loadSavedFont() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _selectedFont = prefs.getString('selected_font') ?? 'Default';
    });
  }
  
  // Lưu font đã chọn vào SharedPreferences và cập nhật toàn bộ ứng dụng
  Future<void> _saveFont(String font) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('selected_font', font);
    
    // Cập nhật font cho toàn bộ ứng dụng
    myAppKey.currentState?.updateFont(font);
    
    // Hiển thị thông báo
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Đã thay đổi font toàn bộ ứng dụng thành: $font'),
          backgroundColor: const Color(0xFF4CAF97),
          duration: const Duration(seconds: 1),
        ),
      );
    }
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
        title: Text(
          'Appearance',
          style: TextStyle(
            color: Colors.white,
            fontFamily: _selectedFont == 'Default' ? null : _selectedFont,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Dark Mode with toggle
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Dark Mode',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                    fontFamily: _selectedFont == 'Default' ? null : _selectedFont,
                  ),
                ),
                _buildToggleSwitch(_darkMode, (value) {
                  setState(() {
                    _darkMode = value;
                  });
                }),
              ],
            ),
            
            const SizedBox(height: 20.0),
            
            // Font option with dropdown
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Font',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                    fontFamily: _selectedFont == 'Default' ? null : _selectedFont,
                  ),
                ),
                _buildFontDropdown(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildToggleSwitch(bool value, Function(bool) onChanged) {
    return GestureDetector(
      onTap: () => onChanged(!value),
      child: Container(
        width: 51, 
        height: 31, 
        clipBehavior: Clip.antiAlias, 
        decoration: ShapeDecoration(
          color: value ? const Color(0xFF34C759) : Colors.grey,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              left: value ? 22 : 2,
              top: 2,
              child: Container(
                width: 27,
                height: 27,
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                  shadows: const [
                    BoxShadow(
                      color: Color(0x0F000000),
                      blurRadius: 1,
                      offset: Offset(0, 3),
                      spreadRadius: 0,
                    ),
                    BoxShadow(
                      color: Color(0x26000000),
                      blurRadius: 8,
                      offset: Offset(0, 3),
                      spreadRadius: 0,
                    ),
                    BoxShadow(
                      color: Color(0x0A000000),
                      blurRadius: 0,
                      offset: Offset(0, 0),
                      spreadRadius: 1,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  
  Widget _buildFontDropdown() {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF333333),
        borderRadius: BorderRadius.circular(8.0),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
      child: DropdownButton<String>(
        value: _selectedFont,
        icon: const Icon(Icons.arrow_drop_down, color: Colors.white),
        iconSize: 24,
        elevation: 16,
        dropdownColor: const Color(0xFF333333),
        style: TextStyle(
          color: Colors.white,
          fontFamily: _selectedFont == 'Default' ? null : _selectedFont,
        ),
        underline: Container(height: 0), // Bỏ đường gạch chân mặc định
        onChanged: (String? newValue) {
          if (newValue != null) {
            setState(() {
              _selectedFont = newValue;
            });
            _saveFont(newValue); // Lưu font và cập nhật toàn bộ ứng dụng
          }
        },
        items: _fontOptions.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style: TextStyle(
                fontFamily: value == 'Default' ? null : value,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}