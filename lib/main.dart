import 'package:chat_app/common/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'routes.dart';

// Tạo GlobalKey để truy cập MyAppState từ bất kỳ đâu
final GlobalKey<_MyAppState> myAppKey = GlobalKey<_MyAppState>();

void main() {
  // Đảm bảo các binding được khởi tạo
  WidgetsFlutterBinding.ensureInitialized();
  
  // Cố định ứng dụng ở chế độ portrait
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  
  runApp(MyApp(key: myAppKey));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _selectedFont = 'Default';
  
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
  
  // Phương thức công khai để cập nhật font từ bất kỳ màn hình nào
  void updateFont(String newFont) {
    setState(() {
      _selectedFont = newFont;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Lấy theme mặc định
    ThemeData baseTheme = AppTheme.darkTheme;
    
    // Áp dụng font đã chọn
    if (_selectedFont != 'Default') {
      baseTheme = baseTheme.copyWith(
        textTheme: baseTheme.textTheme.apply(
          fontFamily: _selectedFont,
        ),
        primaryTextTheme: baseTheme.primaryTextTheme.apply(
          fontFamily: _selectedFont,
        ),
      );
    }
    
    return MaterialApp(
      title: 'Chat App',
      debugShowCheckedModeBanner: false,
      theme: baseTheme,
      initialRoute: Routes.opening,
      routes: Routes.getRoutes(),
    );
  }
}