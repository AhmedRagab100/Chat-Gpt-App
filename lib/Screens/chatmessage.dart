import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatMessage extends StatelessWidget {
  const ChatMessage(
      {super.key,
      required this.text,
      required this.sender,
      });

  final String text;
  final String sender;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(right: 14.0.w),
          child: CircleAvatar(
            
            backgroundColor: Colors.purple[600],
            child:const Icon(Icons.person,color: Colors.white,),
            ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(sender,style: TextStyle(fontSize: 18.sp)),
            
              Padding(
                padding: EdgeInsets.only(bottom: 8.h,left: 5.w),
                child: Container(
                  margin: EdgeInsets.only(top: 8.0.h),
                  child: Text(text , style:TextStyle(fontSize: 16.sp),),
                ),
              ),
              SizedBox(height: 15.h,),
          ],)
        )
      ],
    );
  }

  void insert(List list, int index, dynamic element) {
  list.insert(index, element);
}
}