import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ChatScreen(),
    );
  }
}

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat'),
        leading: Icon(Icons.arrow_back),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(16.0),
              children: [
                ChatBubble(text: "Hello chatGPT, how are you today?", isMe: true),
                SizedBox(height: 30,),
                ChatBubble(text: "Hello, I'm fine, how can I help you?", isMe: false),
                SizedBox(height: 30,),
                ChatBubble(text: "What is the best programming language?", isMe: true),
                SizedBox(height: 30,),
                ChatBubble(text: "There are many programming languages in the \n market that are used in designing and \n building websites, various applications and \n other tasks. All these languages are \n popular in their place and in the way \n they are used, and many programmers \n learn and use them..", isMe: false),
                SizedBox(height: 30,),
                ChatBubble(text: "So explain to me more", isMe: true),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(30.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Write your message",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(Icons.send, color: Colors.green),
                        onPressed: () {},
                      ),
                    ),
                  ),
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ChatBubble extends StatelessWidget {
  final String text;
  final bool isMe;

  ChatBubble({required this.text, required this.isMe});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 4.0),
        padding: EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: isMe ? Colors.green : Colors.grey[300],
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Text(
          text,
          style: TextStyle(color: isMe ? Colors.white : Colors.black),
        ),
      ),
    );
  }
}