import 'package:capstone/view/widget/chat_widget.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat'),
        leading: IconButton(onPressed: () {
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back)),
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(16.0),
              children: [
                SizedBox(height: 20,),
                ChatWidget(text: "Hello chatGPT,how are you today?", isMe: true),
                SizedBox(height: 40,),
                ChatWidget(text: "Hello,i’m fine,how can i help you?", isMe: false),
                SizedBox(height: 40,),
                ChatWidget(text: "What is the best programming language?", isMe: true),
                SizedBox(height: 40,),
                ChatWidget(text: "There are many programming languages ​​in the market that are used in designing and building websites, various applications and other tasks. All these languages ​​are popular in their place and in the way they are used, and many programmers learn and use them.", isMe: false),
                SizedBox(height: 40,),
                ChatWidget(text: "So explain to me more", isMe: true),

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
