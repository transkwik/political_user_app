import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter/material.dart';
//  import 'dart:ffi';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'dart:convert';
import 'dart:io';

import 'package:ysrct_political/bottomnavigation.dart';
import 'package:ysrct_political/constants/imageConstant.dart';
import 'package:ysrct_political/login_screen.dart';

import 'constants/constants.dart';

// import 'package:zoto_user/constants/imageConstant.dart';
// import 'package:zoto_user/views/bottomnavigation.dart';
// import 'package:zoto_user/views/Cashback_homepage/homepage.dart';

// import 'constants/constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, screenType) {
      return GetMaterialApp(
        color: tPrimaryColor,
        title: 'YSRCP',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: Colors.blue, // Primary color of your app
            secondary: Colors.green, // Accent color
          ),
          //   useMaterial3: true, // Enables Material 3 design

          scaffoldBackgroundColor: Colors.white, // Default background color
          primaryColor: Colors.blue,
          //   appBarTheme: AppBarTheme(
          //     color:
          //         tWhite, // Ensure the app bar's background color is set to white

          //     shadowColor: tWhite, // Set default shadow color
          //   ),

          //   fontFamily: 'WixMadefor', // Keeps your custom font
        ),
        home: Scaffold(
          body: Container(
            child: Stack( 
              alignment: Alignment.center,
              children: [
                AnimatedSplashScreen(
                  duration: 1000,
                  splash: Image.asset(
                 Images.Logo,
                    // scale: 4,
                  ),
                  splashIconSize: 1000,
                  nextScreen: LoginPage(),
                  // nextScreen: BottomNavBar(),
                  // nextScreen: CashbackHomePage(),

                  splashTransition: SplashTransition.scaleTransition,
                  backgroundColor: Colors.white,
                ),
                // Positioned(
                //   bottom: 10,
                //   child: Column(
                //     crossAxisAlignment: CrossAxisAlignment.center,
                //     mainAxisAlignment: MainAxisAlignment.center,
                //     children: [
                //       Image.network(
                //         "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTLih8N_hx4x22XAO8VHFUIBobf2xoHszT_Wg&s",
                //         scale: 3,
                //       ),
                //     ],
                //   ),
                // ),
              ],
            ),
          ),
        ),
      );
    });
  }
}

// class CustomPageTransitionBuilder extends PageTransitionsBuilder {
//   @override
//   Widget buildTransitions<T>(
//     PageRoute<T> route,
//     BuildContext context,
//     Animation<double> animation,
//     Animation<double> secondaryAnimation,
//     Widget child,
//   ) {
//     final offsetTween = Tween(begin: Offset(1.0, 0.0), end: Offset.zero);
//     final fadeTween = Tween(begin: 0.0, end: 1.0);

//     // Apply easing curves for smoother transitions
//     final curvedAnimation = CurvedAnimation(
//       parent: animation,
//       curve: Curves.easeInOut, // You can experiment with other curves
//     );

//     return SlideTransition(
//       position: curvedAnimation.drive(offsetTween),
//       child: FadeTransition(
//         opacity: curvedAnimation.drive(fadeTween),
//         child: child,
//       ),
//     );
//   }
// }

// void onDidReceiveLocalNotification(
//     int? id, String? title, String? body, String? payload) {}
