import 'package:flutter/material.dart';
import 'features/auth/presentation/pages/opening_screen.dart';
import 'features/auth/presentation/pages/get_started_screen.dart';
import 'features/auth/presentation/pages/login_screen.dart';
import 'features/auth/presentation/pages/verification_screen.dart';
import 'features/auth/presentation/pages/user_settings_screen.dart';
import 'features/home/presentation/pages/home_screen.dart';
import 'features/chat/presentation/pages/chat_screen.dart';
import 'features/chat/presentation/pages/personal_chat_screen.dart';

class Routes {
  static const String opening = '/';
  static const String get_started = '/get_started';
  static const String login = '/login';
  static const String verification = '/verification';
  static const String user_settings = '/user_settings';
  static const String home = '/home';
  static const String chat = '/chat';
  static const String personChat = '/person_chat';

  static Map<String, WidgetBuilder> getRoutes() {
    return {
      opening: (context) => const OpeningScreen(),
      get_started: (context) => const GetStartedScreen(),
      login: (context) => const LoginScreen(),
      verification: (context) => const VerificationScreen(),
      user_settings: (context) => const UserSettingsScreen(),
      home: (context) => const HomeScreen(),
      chat: (context) => const ChatScreen(),
      personChat: (context) => const PersonChatScreen(),
    };
  }
}