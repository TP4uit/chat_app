import 'package:chat_app/features/setting/presentation/pages/invite_friend_page.dart';
import 'package:flutter/material.dart';
import 'features/auth/presentation/pages/create_profile_screen.dart';
import 'features/auth/presentation/pages/loading_screen.dart';
import 'features/auth/presentation/pages/phone_number_screen.dart';
import 'features/auth/presentation/pages/verification_code_screen.dart';
import 'features/auth/presentation/pages/welcome_screen.dart';
import 'features/home/presentation/pages/home_screen.dart';
import 'features/chat/presentation/pages/chat_screen.dart';

class Routes {
  static const String welcome = '/';
  static const String phone = '/phone';
  static const String verification = '/verification';
  static const String createProfile = '/create_profile';
  static const String loading = '/loading';
  static const String home = '/home';
  static const String chat = '/chat';
  static const String invite = '/invite';

  static Map<String, WidgetBuilder> getRoutes() {
    return {
      welcome: (context) => const WelcomeScreen(),
      phone: (context) => const PhoneNumberScreen(),
      verification: (context) => const VerificationCodeScreen(),
      createProfile: (context) => const CreateProfileScreen(),
      loading: (context) => const LoadingScreen(),
      home: (context) => const HomeScreen(),
      chat: (context) => const ChatScreen(),
      invite: (context) => const InviteFriendPage(),
    };
  }
}