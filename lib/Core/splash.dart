
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:chatbot/Screens/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent,elevation: 0,),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        
        children:  [
          SizedBox(
            height: 250.h,
            child: AnimatedSplashScreen(
              backgroundColor:const Color.fromARGB(0, 255, 255, 255),
              splashIconSize: 200,
              splashTransition: SplashTransition.slideTransition,
              splash: Image(image:const AssetImage('assets/splash.png'),width: 380.w,height: 280.h,),
              
                
              
              nextScreen:const ChatScreen()
              ),
          ),
            
      
              SizedBox(
                height: 100.h,
                child: const SpinKitThreeBounce(
                    color: Colors.purple,
                    size: 30.0,
                    
                    
                  ),
              ),
        ],
      ),
    );
  }
}