// ignore_for_file: prefer_const_constructors
import 'dart:ui'; // Required for ImageFilter
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:video_player/video_player.dart';
import 'package:ysrct_political/constants/constants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ysrct_political/constants/imageConstant.dart';
import 'package:ysrct_political/notification_screen/notification_screen.dart';
import 'package:ysrct_political/profile_screen/profile_screen.dart';
import 'package:figma_squircle/figma_squircle.dart';
import 'package:ysrct_political/responsive.dart';
import '../Report_Crime_or_Extortion_screen/ReportCrimeorExtortion.dart';

class PromoScreenPage extends StatefulWidget {
  @override
  State<PromoScreenPage> createState() => _PromoScreenPageState();
}

class _PromoScreenPageState extends State<PromoScreenPage> {
  late List<VideoPlayerController> _controllers;
  final List<String> videoPaths = [
    "assets/politicalvideo3.mp4",
    // "assets/politicalvideo10.mp4",

    // "assets/politicalvideo8.mp4",
    // "assets/politicalvideo7.mp4",
    // "assets/politicalvideo6.mp4",
    "assets/politicalvideo5.mp4",
    "assets/politicalvideo4.mp4",
    "assets/politicalvideo2.mp4",
    'assets/politicalvideoone.mp4',
    "assets/politicalvideo9.mp4",
    // "assets/pliticalvideo5.mp4",
  ];

  @override
  void initState() {
    super.initState();

    _controllers = videoPaths.map((path) {
      final controller = VideoPlayerController.asset(path);
      controller.initialize(); // You can await this if needed
      return controller;
    }).toList();
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void _playVideo(int index) {
    setState(() {
      for (int i = 0; i < _controllers.length; i++) {
        if (i == index) {
          if (_controllers[i].value.isPlaying) {
            _controllers[i].pause();
          } else {
            _controllers[i].play();
          }
        } else {
          _controllers[i].pause();
        }
      }
    });
  }

  int _selectedTabIndex = 0;

  void _onTabSelected(int index) {
    setState(() {
      _selectedTabIndex = index; // Update the selected tab index
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: tPrimaryColor.withOpacity(0.1),
        appBar: AppBar(
          backgroundColor: Colors.blue.shade50,
          elevation: 0,
          automaticallyImplyLeading: false,
          scrolledUnderElevation: 0.0,

          // ignore: prefer_const_constructors
          flexibleSpace: Padding(
            padding: EdgeInsets.only(top: 30),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                SizedBox(width: 10),
                // ignore: prefer_const_constructors
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProfileScreen(),
                      ),
                    );
                  },
                  child: Container(
                    height: 40,
                    width: 40,
                    margin: EdgeInsets.symmetric(horizontal: 4),
                    decoration: ShapeDecoration(
                      shape: SmoothRectangleBorder(
                        borderRadius: SmoothBorderRadius(
                          cornerRadius: isTab(context) ? 8 : 10,
                          cornerSmoothing: 1.0,
                        ),
                      ),
                      shadows: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 4,
                          blurRadius: 5,
                          offset: Offset(0, 8), // changes position of shadow
                        ),
                      ],
                      image: DecorationImage(
                          image: NetworkImage(

                              // fit: BoxFit.cover,
                              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ3Sd_Sqq0eVSFx_7EuEUqH74rGOcGeAn8rqQ&s"),
                          fit: BoxFit.fill),
                      // color: Colors.blue.withOpacity(0.), // Light pink background
                    ),
                  ),
                ),
                SizedBox(width: 5),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Welcome Back!",
                        style: GoogleFonts.manrope(
                            fontSize: 8.sp,
                            color: tGray,
                            fontWeight: FontWeight.w500)),
                    Text("Sujith Reddy",
                        style: GoogleFonts.amaranth(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w700,
                            color: tPrimaryColor)),
                  ],
                ),
                Spacer(),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ReportCrimeScreen(),
                      ),
                    );
                  },
                  child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      margin: EdgeInsets.symmetric(horizontal: 4),
                      decoration: BoxDecoration(
                        color: Colors.red
                            .withOpacity(0.1), // Light pink background
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Row(
                        children: [
                          Text("Report",
                              style: GoogleFonts.manrope(
                                  fontSize: 8.sp,
                                  color: tredcolor,
                                  fontWeight: FontWeight.w500)),
                          Icon(
                            Icons.chevron_right,
                            color: Colors.red,
                            size: 16,
                          ),
                        ],
                      )),
                ),

                Stack(
                  alignment: Alignment.topRight,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => NotificationsScreen()
                              // BottomNavigation()

                              ),
                        );
                      },
                      child: Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                          margin: EdgeInsets.symmetric(horizontal: 4),
                          decoration: BoxDecoration(
                            color: Colors.grey
                                .withOpacity(0.2), // Light pink background
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Icon(
                            Icons.message_outlined,
                            color: Colors.blue,
                            size: 20,
                          )),
                    ),
                    CircleAvatar(
                      radius: 8,
                      backgroundColor: Colors.orange,
                      child: Text("10",
                          style: TextStyle(fontSize: 10, color: Colors.white)),
                    )
                  ],
                ),
                SizedBox(width: 10),
              ],
            ),
          ),
        ),
        body: ListView.builder(
          shrinkWrap: true,
          itemCount: _controllers.length,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.symmetric(vertical: 1, horizontal: 0),
              decoration: BoxDecoration(

                  // borderRadius: BorderRadius.circular(10),
                  // boxShadow: [
                  //   BoxShadow(
                  //     color: Colors.grey.withOpacity(0.2),
                  //     spreadRadius: 1,
                  //     blurRadius: 5,
                  //     offset: Offset(0, 3), // changes position of shadow
                  //   ),
                  // ],
                  ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // User Info

                  SizedBox(
                    height: 1.h,
                  ),
                  // Video Player
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      _controllers[index].value.isInitialized
                          ? AspectRatio(
                              aspectRatio:
                                  _controllers[index].value.aspectRatio,
                              child: VideoPlayer(_controllers[index]),
                            )
                          : AspectRatio(
                              aspectRatio:
                                  _controllers[index].value.aspectRatio,
                              child:
                                  Center(child: CircularProgressIndicator())),
                      GestureDetector(
                        onTap: () => _playVideo(index),
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              // Background blur
                              ClipRRect(
                                borderRadius: BorderRadius.circular(
                                    100), // match the CircleAvatar
                                child: BackdropFilter(
                                  filter: ImageFilter.blur(
                                      sigmaX: 10.0, sigmaY: 10.0),
                                  child: Container(
                                    width: 70, // double the radius
                                    height: 70,
                                    color: Colors.black.withOpacity(
                                        0.2), // semi-transparent overlay
                                  ),
                                ),
                              ),

                              // The actual CircleAvatar
                              CircleAvatar(
                                maxRadius: 40,
                                backgroundColor: Colors.transparent,
                                child: Icon(
                                  size: 40,
                                  color: Colors.white,
                                  _controllers[index].value.isPlaying
                                      ? Icons.pause_rounded
                                      : Icons.play_arrow_rounded,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 1.h),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 22, vertical: 8),
                    child: Row(
                      children: [
                        Icon(
                          Icons.download_outlined,
                          color: Colors.grey,
                          size: 20,
                        ),
                        SizedBox(width: 4),
                        Text(
                          "45",
                          style: GoogleFonts.wixMadeforDisplay(
                              color: tGray,
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w600),
                        ),
                        Spacer(),
                        Icon(
                          Icons.remove_red_eye_outlined,
                          color: tGray,
                          size: 18,
                        ),
                        SizedBox(width: 4),
                        Text(
                          "165",
                          style: GoogleFonts.wixMadeforDisplay(
                              color: tGray,
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                          margin: EdgeInsets.symmetric(horizontal: 4),
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                spreadRadius: 0,
                                blurRadius: 1,
                                offset:
                                    Offset(0, 1), // changes position of shadow
                              ),
                            ],
                            color: tPrimaryColor, // Light pink background
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.download_for_offline_outlined,
                                color: tWhite,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                          margin: EdgeInsets.symmetric(horizontal: 4),
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                spreadRadius: 0,
                                blurRadius: 1,
                                offset:
                                    Offset(0, 1), // changes position of shadow
                              ),
                            ],
                            color: Colors.white, // Light pink background
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.share_outlined,
                                color: tPrimaryColor,
                              ),
                              SizedBox(width: 4),
                              Text(
                                "Share",
                                style: GoogleFonts.manrope(
                                    color: tBlack,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ),
                        // Container(
                        //     padding: EdgeInsets.symmetric(
                        //         horizontal: 10, vertical: 10),
                        //     margin: EdgeInsets.symmetric(horizontal: 4),
                        //     decoration: BoxDecoration(
                        //       color: Colors.white, // Light pink background
                        //       borderRadius: BorderRadius.circular(10),
                        //     ),
                        //     child: Icon(
                        //       Icons.share_outlined,
                        //       color: tPrimaryColor,
                        //     )),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 25, vertical: 10),
                          margin: EdgeInsets.symmetric(horizontal: 4),
                          decoration: ShapeDecoration(
                            color: tSecondaryGreen, // Light pink background
                            shape: SmoothRectangleBorder(
                              borderRadius: SmoothBorderRadius(
                                cornerRadius: isTab(context) ? 10 : 13,
                                cornerSmoothing: 1.0,
                              ),
                            ),
                          ),
                          child: Row(
                            children: [
                              Image.network(
                                "https://static.vecteezy.com/system/resources/thumbnails/021/495/979/small/whatsapp-social-media-logo-icon-free-png.png",
                                height: 20,
                                width: 20,
                              ),
                              SizedBox(width: 4),
                              Text(
                                "Whatsapp",
                                style: GoogleFonts.manrope(
                                    color: tWhite,
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 1.h),
                ],
              ),
            );
          },
        ));
  }
}
