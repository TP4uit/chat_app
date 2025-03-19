import 'package:chat_app/common/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'routes.dart';

void main() {
  // Đảm bảo các binding được khởi tạo
  WidgetsFlutterBinding.ensureInitialized();
  
  // Cố định ứng dụng ở chế độ portrait
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chat App',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme ,
      initialRoute: Routes.welcome,
      routes: Routes.getRoutes(),
    );
  }
}