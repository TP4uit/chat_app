import 'package:flutter/material.dart';
import 'screens/onboarding/welcome_screen.dart';
import 'screens/onboarding/phone_number_screen.dart';
import 'screens/onboarding/verification_code_screen.dart';
import 'screens/onboarding/create_profile_screen.dart';
import 'screens/onboarding/loading_screen.dart';
import 'screens/home/home_screen.dart';
import 'screens/chat/chat_screen.dart';

class Routes {
  static const String welcome = '/';
  static const String phone = '/phone';
  static const String verification = '/verification';
  static const String createProfile = '/create_profile';
  static const String loading = '/loading';
  static const String home = '/home';
  static const String chat = '/chat';

  static Map<String, WidgetBuilder> getRoutes() {
    return {
      welcome: (context) => const WelcomeScreen(),
      phone: (context) => const PhoneNumberScreen(),
      verification: (context) => const VerificationCodeScreen(),
      createProfile: (context) => const CreateProfileScreen(),
      loading: (context) => const LoadingScreen(),
      home: (context) => const HomeScreen(),
      chat: (context) => const ChatScreen(),
    };
  }
}