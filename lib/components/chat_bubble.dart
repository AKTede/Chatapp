import 'package:chat_app_test/themes/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatBubble extends StatelessWidget {
  final String message;
  final bool isCurrentUser;
  final String time;

  const ChatBubble({
    super.key,
    required this.message,
    required this.isCurrentUser,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    // Light vs dark mode for correct bubble colors
    bool isDarkMode = Provider.of<ThemeProvider>(context, listen: false).isDarkMode;

    return Align(
      alignment: isCurrentUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 10),
        child: IntrinsicWidth(
          child: Container(
            padding: const EdgeInsets.all(10),
            constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.7),
            decoration: BoxDecoration(
              color: isCurrentUser
                  ? (isDarkMode ? Colors.purple.shade600 : Colors.green.shade600)
                  : (isDarkMode ? Colors.blue.shade200 : Colors.grey),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  message,
                  style: TextStyle(
                    color: isDarkMode ? Colors.white : Colors.black,
                  ),
                ),
                const SizedBox(height: 5),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    time,
                    style: TextStyle(
                      color: isDarkMode ? Colors.white54 : Colors.black54,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}





/**import 'package:chat_app_test/themes/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatBubble extends StatelessWidget {
  final String message;
  final bool isCurrentUser;
  const ChatBubble({super.key, required this.message, required this.isCurrentUser});

  @override
  Widget build(BuildContext context) {
    //light vs dark mode for corrects bubble colors
    bool isDarkMode = Provider.of<ThemeProvider>(context, listen: false).isDarkMode;

    return Container(
      decoration: BoxDecoration(
        color: isCurrentUser 
        ? (isDarkMode ? Colors.purple.shade600 : Colors.green.shade600)
        : (isDarkMode ? Colors.blue.shade200 : Colors.grey) ,
        borderRadius: BorderRadius.circular(12)
      ),
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(
        vertical: 5, 
        horizontal: 25
      ),
      child: Text(
        message,
        style: TextStyle(
          color: isDarkMode ? Colors.white : (
            isDarkMode ? Colors.white : Colors.black
          ) 
        ),
      ),
    );
  }
}*/