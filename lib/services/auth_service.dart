import 'dart:async';
import '../models/user_model.dart';

class AuthService {
  // Singleton pattern
  static final AuthService _instance = AuthService._internal();
  factory AuthService() => _instance;
  AuthService._internal();
  
  // User hiện tại
  User? _currentUser;
  User? get currentUser => _currentUser;
  
  // Stream để theo dõi trạng thái đăng nhập
  final StreamController<User?> _authStateController = StreamController<User?>.broadcast();
  Stream<User?> get authStateChanges => _authStateController.stream;
  
  // Giả lập gửi mã xác minh
  Future<bool> sendVerificationCode(String phoneNumber) async {
    // Trong thực tế, bạn sẽ gọi API hoặc Firebase để gửi SMS
    await Future.delayed(const Duration(seconds: 1));
    return true;
  }
  
  // Giả lập xác minh mã
  Future<bool> verifyCode(String phoneNumber, String code) async {
    // Trong thực tế, bạn sẽ gọi API hoặc Firebase để xác minh
    await Future.delayed(const Duration(seconds: 1));
    
    // Giả sử mã đúng là "1234"
    return code == "1234";
  }
  
  // Giả lập tạo hoặc cập nhật hồ sơ
  Future<User> createOrUpdateProfile({
    required String phoneNumber,
    required String username,
    String? profilePictureUrl,
  }) async {
    // Trong thực tế, bạn sẽ gọi API hoặc Firebase để tạo/cập nhật
    await Future.delayed(const Duration(seconds: 1));
    
    final user = User(
      id: 'user_${DateTime.now().millisecondsSinceEpoch}',
      phoneNumber: phoneNumber,
      username: username,
      profilePictureUrl: profilePictureUrl,
      isOnline: true,
    );
    
    _currentUser = user;
    _authStateController.add(user);
    
    return user;
  }
  
  // Đăng xuất
  Future<void> signOut() async {
    // Trong thực tế, bạn sẽ gọi API hoặc Firebase để đăng xuất
    await Future.delayed(const Duration(milliseconds: 500));
    
    _currentUser = null;
    _authStateController.add(null);
  }
  
  // Giải phóng tài nguyên
  void dispose() {
    _authStateController.close();
  }
}