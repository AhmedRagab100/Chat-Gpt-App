
import 'package:flutter/material.dart';

class ChatFormField extends StatelessWidget {
  const ChatFormField({super.key,required this.sendMessage,required this.controller});
  final TextEditingController controller ;
  final Function() sendMessage;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          border: Border.all(width: 1, color: Colors.black)),
      child: Padding(
        padding: const EdgeInsets.only(left: 15),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                onSubmitted: (value) => sendMessage(),
                controller: controller,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration.collapsed(
                    hintText: 'Send a message',
                    hintStyle: TextStyle(color: Colors.black)),
              ),
            ),
            IconButton(
                onPressed: () {
                  if (controller.text == '') {
                    return;
                  } else {
                    sendMessage();
                  }
                },
                icon:const Icon(
                  Icons.send,
                  size: 27,
                  color: Colors.purple
                      
                ))
          ],
        ),
      ),
    );
  }
}