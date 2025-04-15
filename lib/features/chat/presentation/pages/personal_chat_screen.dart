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
    // Sample messages for demo
    _loadSampleMessages();
  }

  void _loadSampleMessages() {
    DateTime date = DateTime(2025, 4, 15, 16, 46);
    
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
    
    DateTime newDate = DateTime(2025, 4, 15, 9, 12);
    _messages.add(
      ChatMessage(
        text: '421414',
        time: '09:12',
        isMe: true,
        isRead: false,
        date: newDate,
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

    // Scroll to the latest message
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
    // Get user info from parameters (if any)
    final arguments = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    final name = arguments?['name'] as String? ?? 'User 0';
    final avatarUrl = arguments?['avatarUrl'] as String?;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black,
        leading: BackButton(color: Colors.white),
        titleSpacing: 0,
        toolbarHeight: 60, // Increased height to match image
        title: Row(
          children: [
            CircleAvatar(
              radius: 20, // Increased radius
              backgroundColor: Colors.orange,
              backgroundImage: avatarUrl != null ? NetworkImage(avatarUrl) : null,
              child: avatarUrl == null ? const Icon(Icons.person, color: Colors.white) : null,
            ),
            const SizedBox(width: 12), // Increased spacing
            Text(
              name,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18, // Increased font size
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 12),
            child: IconButton(
              icon: Icon(Icons.videocam_outlined, color: Colors.white, size: 30), // Increased size
              onPressed: () {},
            ),
          ),
          Container(
            margin: const EdgeInsets.only(right: 12),
            child: IconButton(
              icon: Icon(Icons.call, color: Colors.white, size: 26), // Increased size
              onPressed: () {},
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          // Message list
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              padding: const EdgeInsets.all(16.0),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[index];
                final previousMessage = index > 0 ? _messages[index - 1] : null;
                
                // Check if this message is a new day
                bool showDateHeader = false;
                if (previousMessage == null || 
                    !_isSameDay(message.date, previousMessage.date)) {
                  showDateHeader = true;
                }
                
                return Column(
                  children: [
                    // Show date header if needed
                    if (showDateHeader)
                      _buildDateHeader(message.date),
                    
                    // Message
                    _buildMessageItem(message),
                  ],
                );
              },
            ),
          ),
          
          // Message input bar
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0), // Điều chỉnh padding
            color: Colors.black, // Giữ nền đen
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center, // Căn giữa các item theo chiều dọc
              children: [
                IconButton(
                  icon: Icon(
                    Icons.camera_alt_outlined, // Sử dụng icon outlined
                    color: Colors.grey.shade400, // Màu xám nhạt hơn
                    size: 26, // Giảm kích thước một chút
                  ),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(
                    Icons.photo_outlined, // Sử dụng icon outlined
                    color: Colors.grey.shade400, // Màu xám nhạt hơn
                    size: 26, // Giảm kích thước một chút
                  ),
                  onPressed: () {},
                ),
                const SizedBox(width: 8), // Thêm khoảng cách nhỏ
                Expanded(
                  child: Container(
                    height: 44, // Giảm chiều cao một chút
                    decoration: BoxDecoration(
                      color: Colors.grey.shade900, // Màu nền xám tối cho TextField
                      borderRadius: BorderRadius.circular(22.0), // Bo tròn góc
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: _messageController,
                            style: const TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0), // Màu chữ trắng
                              fontSize: 16.0,
                            ),
                            decoration: InputDecoration(
                              hintText: 'Text a message.........', // Thay đổi hint text
                              hintStyle: TextStyle(
                                color: Colors.grey.shade500, // Màu hint text xám
                                fontSize: 16.0, // Đồng bộ kích thước font
                              ),
                              border: InputBorder.none,
                              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12), // Điều chỉnh padding bên trong
                            ),
                            textAlignVertical: TextAlignVertical.center,
                          ),
                        ),
                        // Mic button (inside the TextField container)
                        InkWell(
                           borderRadius: BorderRadius.circular(20),
                           onTap: () {
                             // Mic functionality
                           },
                           child: Padding(
                             padding: const EdgeInsets.symmetric(horizontal: 10.0), // Padding cho mic
                             child: Icon(
                               Icons.mic_none_outlined, // Icon mic khác
                               color: Colors.grey.shade400, // Màu xám nhạt
                               size: 24,
                             ),
                           ),
                         ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 8), // Thêm khoảng cách
                Container(
                  width: 44, // Giữ kích thước nút gửi
                  height: 44,
                  decoration: const BoxDecoration(
                    color: Color(0xFF00B2A3),
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    icon: const Icon(
                      Icons.send,
                      color: Colors.white,
                      size: 22,
                    ),
                    onPressed: _sendMessage,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Function to check if two dates are the same day
  bool _isSameDay(DateTime d1, DateTime d2) {
    return d1.year == d2.year && d1.month == d2.month && d1.day == d2.day;
  }

  Widget _buildDateHeader(DateTime date) {
    // Format date: "Sat, 25/07/2023"
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

  // Function to format date: "Tue, 15/04/2025"
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
      // Current user's messages (right side)
      return Align(
        alignment: Alignment.centerRight,
        child: Container(
          margin: const EdgeInsets.only(bottom: 8),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: const Color(0xFFA7F0C8), // Light mint green to match image
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
                style: const TextStyle(color: Colors.black), // Text color changed to black
              ),
              const SizedBox(height: 2),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    message.time,
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.6),
                      fontSize: 10,
                    ),
                  ),
                  if (message.isRead)
                    Text(
                      ' • Read',
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.6),
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
      // Other's messages (left side)
      return Align(
        alignment: Alignment.centerLeft,
        child: Container(
          margin: const EdgeInsets.only(bottom: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (message.senderName != null)
                Padding(
                  padding: const EdgeInsets.only(left: 12, bottom: 4),
                  child: Text(
                    message.senderName!,
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
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
                          borderRadius: BorderRadius.circular(8),
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
                        const SizedBox(height: 2),
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
                        const SizedBox(height: 2),
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
        ),
      );
    }
  }
}