import 'package:chat_app/features/setting/presentation/pages/invite_friend_page.dart';
import 'package:chat_app/features/setting/presentation/pages/pin_code_page.dart';
import 'package:chat_app/features/setting/presentation/pages/privacy_page.dart';
import 'package:chat_app/features/setting/presentation/pages/settings_screen.dart';
import 'package:chat_app/features/setting/presentation/pages/account_screen.dart';
import 'package:chat_app/features/setting/presentation/pages/notification_screen.dart';
import 'package:chat_app/features/setting/presentation/pages/appearance_screen.dart';
import 'package:chat_app/features/chat/presentation/pages/personal_chat_screen.dart';
import 'package:flutter/material.dart';
import 'features/auth/presentation/pages/opening_screen.dart';
import 'features/auth/presentation/pages/get_started_screen.dart';
import 'features/auth/presentation/pages/login_screen.dart';
import 'features/auth/presentation/pages/verification_screen.dart';
import 'features/auth/presentation/pages/user_settings_screen.dart';
import 'features/home/presentation/pages/home_screen.dart';
import 'features/chat/presentation/pages/chat_screen.dart';
import 'features/setting/presentation/pages/vertify_page.dart';

class Routes {
  static const String opening = '/';
  static const String get_started = '/get_started';
  static const String login = '/login';
  static const String verification = '/verification';
  static const String user_settings = '/user_settings';
  static const String home = '/home';
  static const String chat = '/chat';
  static const String person_chat = '/person_chat';
  static const String settings = '/settings';
  static const String account = '/account';
  static const String notification = '/notification';
  static const String appearance = '/appearance';
  static const String invite = '/invite';
  static const String privacy = '/privacy';
  static const String pin_code = '/pin_code';
  static const String confirm = '/confirm';
  
  static Map<String, WidgetBuilder> getRoutes() {
    return {
      opening: (context) => const OpeningScreen(),
      get_started: (context) => const GetStartedScreen(),
      login: (context) => const LoginScreen(),
      verification: (context) => const VerificationScreen(),
      user_settings: (context) => const UserSettingsScreen(),
      home: (context) => const HomeScreen(),
      chat: (context) => const ChatScreen(),
      person_chat: (context) => const PersonChatScreen(),
      settings: (context) => const SettingsScreen(),
      account: (context) => const AccountScreen(),
      notification: (context) => const NotificationScreen(),
      appearance: (context) => const AppearanceScreen(),
      invite: (context) => const InviteFriendPage(),
      privacy: (context) => const PrivacyPage(),
      pin_code: (context) => const PinCodePage(),
      confirm: (context) => const VertifyPage(),
    };
  }
}