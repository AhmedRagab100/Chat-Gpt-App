import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Network/chat_repo.dart';
import 'build_form.dart';
import 'chatmessage.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController messageController = TextEditingController();
  final _scrollController = ScrollController();
  List<ChatMessage> messages = [];

  void sendMessage() async {

    ChatMessage message = ChatMessage(
      text: messageController.text,
      sender: 'User',
    );

    setState(() {
      messages.insert(0, message);
    });

    var input = messageController.text;

    messageController.clear();

    //send input to function and generate response from gpt
    generateResponse(input).then((value) {
      setState(() {
        messages.add(
          ChatMessage(
            text: value,
            sender: 'Bot',
          ),
        );
      });
    });

    messageController.clear();
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Colors.purple,
        title: Text(
          'Guide AI',
          style:TextStyle(
              fontSize: 26.sp,
              fontWeight: FontWeight.w500,
              color: Colors.white),
        ),
        leading: Padding(
          padding: EdgeInsets.only(left: 15.w,),
          child: Center(
            child: Container(
                width: 40.w,
                height: 40.h,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage(
                        'assets/robot.jpg',
                      ),
                      fit: BoxFit.cover,
                    ))),
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 5.w),
            child: IconButton(
                onPressed: () {
                  setState(() {
                    messages.clear();
                  });
                },
                icon: const Icon(
                  Icons.clear_all_outlined,
                  size: 32,
                  color: Colors.white,
                )),
          )
        ],
        
      ),
      body: SafeArea(
        child: Column(
          children: [
            Flexible(
              child: messages.length == 0? 
              Center(child: Text('There is no messages yet.',style: TextStyle(fontSize: 18.sp,color: Colors.grey),),)
              :Padding(
              padding: EdgeInsets.only(left: 12.w),
              child: ListView.builder(
                  controller: _scrollController,
                  reverse: true,
                  physics: const BouncingScrollPhysics(),
                  itemCount: messages.length,
                  itemBuilder: (context, index) {
                    return messages[index];
                  }),
            )),
            Padding(
              padding: EdgeInsets.only(bottom: 18.h),
              child: Container(
                width: 370.w,
                decoration: const BoxDecoration(),
                child: ChatFormField(
                  sendMessage: sendMessage,
                  controller: messageController,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
