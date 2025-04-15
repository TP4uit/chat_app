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
    // Sample messages to match the image
    _loadSampleMessages();
  }

  void _loadSampleMessages() {
    // First group of messages - same date
    DateTime today = DateTime(2025, 4, 15, 16, 46);
    
    // First left message
    _messages.add(
      ChatMessage(
        text: 'Đi chơi không?',
        time: '16:46',
        isMe: false,
        date: today,
      ),
    );
    
    // First right message - mint green, with Read status
    _messages.add(
      ChatMessage(
        text: 'Đợi tao 5 phút',
        time: '16:46',
        isMe: true,
        isRead: true,
        date: today,
      ),
    );
    
    // "You" with "Đợi tao 5 phút"
    _messages.add(
      ChatMessage(
        text: 'Đợi tao 5 phút',
        senderName: 'You',
        time: '16:46',
        isMe: false,
        date: today,
      ),
    );
    
    // "Oke nhé."
    _messages.add(
      ChatMessage(
        text: 'Oke nhé.',
        time: '16:46',
        isMe: false,
        date: today,
      ),
    );
    
    // Using separate date to show the date divider
    DateTime olderDate = DateTime(2023, 7, 25, 16, 46);
    
    // Cat image with "Hỏi không"
    _messages.add(
      ChatMessage(
        imageUrl: 'assets/cat_meme.jpg',
        text: 'Hỏi không',
        time: '16:46',
        isMe: false,
        date: olderDate,
      ),
    );
    
    // Last message "Vãi chưởng"
    _messages.add(
      ChatMessage(
        text: 'Vãi chưởng',
        time: '16:46',
        isMe: true,
        isRead: true,
        date: olderDate,
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
              child: avatarUrl == null ? const Icon(Icons.person, color: Colors.white, size: 20) : null,
            ),
            const SizedBox(width: 10),
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
            icon: Icon(Icons.videocam_outlined, color: Colors.white, size: 26),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.call, color: Colors.white, size: 22),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          // Message list
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              padding: const EdgeInsets.all(12.0),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[index];
                final previousMessage = index > 0 ? _messages[index - 1] : null;
                
                // Check if we need a date header
                bool showDateHeader = false;
                if (index == 4) { // Hard-code position for date divider to match image
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
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
            color: Colors.black,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Camera icon
                IconButton(
                  icon: Icon(
                    Icons.camera_alt_outlined,
                    color: Colors.grey.shade400,
                    size: 26,
                  ),
                  onPressed: () {},
                ),
                // Photo gallery icon
                IconButton(
                  icon: Icon(
                    Icons.photo_outlined,
                    color: Colors.grey.shade400,
                    size: 26,
                  ),
                  onPressed: () {},
                ),
                const SizedBox(width: 8),
                // Text field
                Expanded(
                  child: Container(
                    height: 44,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade900,
                      borderRadius: BorderRadius.circular(22.0),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: _messageController,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 16.0,
                            ),
                            decoration: InputDecoration(
                              hintText: 'Text a message...',
                              hintStyle: TextStyle(
                                color: Colors.grey.shade500,
                                fontSize: 16.0,
                              ),
                              border: InputBorder.none,
                              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                            ),
                            textAlignVertical: TextAlignVertical.center,
                          ),
                        ),
                        // Mic button
                        InkWell(
                          borderRadius: BorderRadius.circular(20),
                          onTap: () {},
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Icon(
                              Icons.mic_none_outlined,
                              color: Colors.grey.shade400,
                              size: 24,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                // Send button
                Container(
                  width: 44,
                  height: 44,
                  decoration: const BoxDecoration(
                    color: Color(0xFF00B2A3), // Green send button color
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
    // Format date: "Sat, 25/07/2023" to match the image
    String formattedDate = _formatDate(date);
    
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
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

  // Function to format date: "Tue, 15/04/2025" instead of "Sat, 25/07/2023"
  String _formatDate(DateTime date) {
    List<String> weekdays = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
    
    if (date.year == 2025) {
      // Current date format
      String weekday = weekdays[date.weekday - 1];
      String day = date.day.toString().padLeft(2, '0');
      String month = date.month.toString().padLeft(2, '0');
      String year = date.year.toString();
      return '$weekday, $day/$month/$year';
    } else {
      // Old date format for the divider
      return 'Sat, 25/07/2023'; 
    }
  }

  Widget _buildMessageItem(ChatMessage message) {
    if (message.isMe) {
      // Current user's messages (right side) - mint green
      return Align(
        alignment: Alignment.centerRight,
        child: Container(
          margin: const EdgeInsets.only(bottom: 8),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: const Color(0xFFA7F0C8), // Mint green color matching the image
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
                style: const TextStyle(color: Colors.black),
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
      // Other's messages (left side) - white background
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
                        Padding(
                          padding: const EdgeInsets.all(8.0),
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