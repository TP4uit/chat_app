import 'package:flutter/material.dart';
import '../../../../common/constants/colors.dart';

class ChatMessage {
  final String text;
  final String time;
  final bool isMe;
  final bool isRead;
  final String? senderName;
  final String? imageUrl;
  final DateTime date;

  ChatMessage({
    required this.text,
    required this.time,
    required this.isMe, 
    this.isRead = false,
    this.senderName,
    this.imageUrl,
    required this.date,
  });
}

class PersonChatScreen extends StatefulWidget {
  const PersonChatScreen({Key? key}) : super(key: key);

  @override
  _PersonChatScreenState createState() => _PersonChatScreenState();
}

class _PersonChatScreenState extends State<PersonChatScreen> {
  final TextEditingController _messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final List<ChatMessage> _messages = [];
  
  @override
  void initState() {
    super.initState();
    // Mẫu tin nhắn cho demo
    _loadSampleMessages();
  }

  void _loadSampleMessages() {
    DateTime date = DateTime(2023, 7, 25, 16, 46);
    _messages.add(
      ChatMessage(
        text: 'Đi chơi không ?',
        time: '16:46',
        isMe: false,
        date: date,
      ),
    );
    
    _messages.add(
      ChatMessage(
        text: 'Đợi tao 5 phút',
        time: '16:46',
        isMe: true,
        isRead: true,
        date: date,
      ),
    );
    
    _messages.add(
      ChatMessage(
        text: 'Đợi tao 5 phút',
        senderName: 'You',
        time: '16:46',
        isMe: false,
        date: date,
      ),
    );
    
    _messages.add(
      ChatMessage(
        text: 'Oke nhé.',
        time: '16:46',
        isMe: false,
        date: date,
      ),
    );
    
    _messages.add(
      ChatMessage(
        imageUrl: 'assets/cat_meme.jpg',
        text: 'Hỏi không',
        time: '16:46',
        isMe: false,
        date: date,
      ),
    );
    
    _messages.add(
      ChatMessage(
        text: 'Vãi chưởng',
        time: '16:46',
        isMe: true,
        isRead: true,
        date: date,
      ),
    );
  }

  @override
  void dispose() {
    _messageController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _sendMessage() {
    if (_messageController.text.trim().isEmpty) return;

    final now = DateTime.now();
    final hour = now.hour.toString().padLeft(2, '0');
    final minute = now.minute.toString().padLeft(2, '0');
    final timeStr = '$hour:$minute';

    setState(() {
      _messages.add(
        ChatMessage(
          text: _messageController.text.trim(),
          time: timeStr,
          isMe: true,
          date: now,
        ),
      );
      _messageController.clear();
    });

    // Cuộn xuống tin nhắn mới nhất
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // Lấy thông tin người dùng từ tham số truyền vào (nếu có)
    final arguments = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    final name = arguments?['name'] as String? ?? 'Triết';
    final avatarUrl = arguments?['avatarUrl'] as String?;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black,
        leading: BackButton(color: Colors.white),
        titleSpacing: 0,
        title: Row(
          children: [
            CircleAvatar(
              radius: 18,
              backgroundColor: Colors.orange,
              backgroundImage: avatarUrl != null ? NetworkImage(avatarUrl) : null,
              child: avatarUrl == null ? const Icon(Icons.person, color: Colors.white) : null,
            ),
            const SizedBox(width: 8),
            Text(
              name,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.videocam_outlined, color: Colors.white),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.call, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          // Danh sách tin nhắn
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              padding: const EdgeInsets.all(16.0),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[index];
                final previousMessage = index > 0 ? _messages[index - 1] : null;
                
                // Kiểm tra nếu tin nhắn này là ngày mới
                bool showDateHeader = false;
                if (previousMessage == null || 
                    !_isSameDay(message.date, previousMessage.date)) {
                  showDateHeader = true;
                }
                
                return Column(
                  children: [
                    // Hiển thị header ngày nếu cần
                    if (showDateHeader)
                      _buildDateHeader(message.date),
                    
                    // Tin nhắn
                    _buildMessageItem(message),
                  ],
                );
              },
            ),
          ),
          
          // Thanh nhập tin nhắn
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
            color: Colors.black,
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.camera_alt,
                    color: Colors.white,
                  ),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(
                    Icons.photo,
                    color: Colors.white,
                  ),
                  onPressed: () {},
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white, // Đổi sang nền trắng
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: TextField(
                      controller: _messageController,
                      style: const TextStyle(color: Colors.black), // Chữ màu đen
                      decoration: const InputDecoration(
                        hintText: 'Ảo thật đấy',
                        hintStyle: TextStyle(color: Colors.grey),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(
                    Icons.send,
                    color: Color(0xFF4CAF97),
                  ),
                  onPressed: _sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Hàm kiểm tra nếu hai ngày giống nhau
  bool _isSameDay(DateTime d1, DateTime d2) {
    return d1.year == d2.year && d1.month == d2.month && d1.day == d2.day;
  }

  Widget _buildDateHeader(DateTime date) {
    // Format ngày tháng: "Sat, 25/07/2023"
    String formattedDate = _formatDate(date);
    
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        children: [
          Expanded(
            child: Divider(color: Colors.grey.shade700),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              formattedDate,
              style: TextStyle(
                color: Colors.grey.shade500,
                fontSize: 12,
              ),
            ),
          ),
          Expanded(
            child: Divider(color: Colors.grey.shade700),
          ),
        ],
      ),
    );
  }

  // Hàm format ngày theo định dạng "Sat, 25/07/2023"
  String _formatDate(DateTime date) {
    List<String> weekdays = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
    String weekday = weekdays[date.weekday - 1];
    String day = date.day.toString().padLeft(2, '0');
    String month = date.month.toString().padLeft(2, '0');
    String year = date.year.toString();
    
    return '$weekday, $day/$month/$year';
  }

  Widget _buildMessageItem(ChatMessage message) {
    if (message.isMe) {
      // Tin nhắn của người dùng hiện tại (bên phải)
      return Align(
        alignment: Alignment.centerRight,
        child: Container(
          margin: const EdgeInsets.only(bottom: 8),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: const Color(0xFF4CAF97),
            borderRadius: BorderRadius.circular(16),
          ),
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 0.7,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                message.text,
                style: const TextStyle(color: Colors.white),
              ),
              const SizedBox(height: 4),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    message.time,
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 10,
                    ),
                  ),
                  const SizedBox(width: 4),
                  if (message.isRead)
                    const Text(
                      '• Read',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 10,
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
      );
    } else {
      // Tin nhắn của người khác (bên trái)
      return Align(
        alignment: Alignment.centerLeft,
        child: Container(
          margin: const EdgeInsets.only(bottom: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (message.senderName != null)
                Padding(
                  padding: const EdgeInsets.only(left: 8, bottom: 4),
                  child: Text(
                    message.senderName!,
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                    ),
                  ),
                ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  message.imageUrl != null
                      ? Container(
                          width: MediaQuery.of(context).size.width * 0.6,
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.asset(
                                  message.imageUrl!,
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                  errorBuilder: (context, error, stackTrace) {
                                    return Container(
                                      height: 150,
                                      color: Colors.grey,
                                      child: const Center(
                                        child: Icon(Icons.error),
                                      ),
                                    );
                                  },
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                message.text,
                                style: const TextStyle(color: Colors.black),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                message.time,
                                style: TextStyle(
                                  color: Colors.black.withOpacity(0.6),
                                  fontSize: 10,
                                ),
                              ),
                            ],
                          ),
                        )
                      : Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          constraints: BoxConstraints(
                            maxWidth: MediaQuery.of(context).size.width * 0.6,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                message.text,
                                style: const TextStyle(color: Colors.black),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                message.time,
                                style: TextStyle(
                                  color: Colors.black.withOpacity(0.6),
                                  fontSize: 10,
                                ),
                              ),
                            ],
                          ),
                        ),
                ],
              ),
            ],
          ),
        ),
      );
    }
  }
}