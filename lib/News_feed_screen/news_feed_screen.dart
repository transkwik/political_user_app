// ignore_for_file: prefer_const_constructors
import 'dart:ui'; // Required for ImageFilter
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:video_player/video_player.dart';
import 'package:ysrct_political/constants/constants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ysrct_political/constants/imageConstant.dart';
import 'package:ysrct_political/my_task/my_task.dart';
import 'package:ysrct_political/notification_screen/notification_screen.dart';
import 'package:ysrct_political/profile_screen/profile_screen.dart';
import 'package:figma_squircle/figma_squircle.dart';
import 'package:ysrct_political/responsive.dart';
import '../Report_Crime_or_Extortion_screen/ReportCrimeorExtortion.dart';

class NewsFeedPage extends StatefulWidget {
  @override
  State<NewsFeedPage> createState() => _NewsFeedPageState();
}

class _NewsFeedPageState extends State<NewsFeedPage> {
  late List<VideoPlayerController> _controllers;
  final List<String> videoPaths = [
    // "assets/politicalvideo3.mp4",
    "assets/politicalvideo10.mp4",
    // "assets/politicalvideo9.mp4",
    "assets/politicalvideo8.mp4",
    "assets/politicalvideo7.mp4",
    "assets/politicalvideo6.mp4",
    // "assets/politicalvideo5.mp4",
    // "assets/politicalvideo4.mp4",
    // "assets/politicalvideo2.mp4",
    // 'assets/politicalvideoone.mp4',
    "assets/pliticalvideo5.mp4",
  ];
  final List<String> QuationPaths = [
    
    "Send Pictures of Bad Roads",
  
    "Water Supply Issues",
    "Electricity Problems",
     "Garbage Collection",
     "Street Lighting"
  ];
  final List<String> QuationPolls = [
    
    "Do You Satisfied with Chandra Babu Naidu Governence?",
    "Do You Think Social Media Arrests in Andhra Pradesh are Lowful?",
  
    "Should Chandra Babu Focus More on Youth Employment?",
    "Do You Support the Three-Capital Plan in AP?",
    "Is the Education System Improving Under the New Government?",
    "Do You Think Corruption Has Reduced in Recent Governance??",
     
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
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    margin: EdgeInsets.symmetric(horizontal: 4),
                    decoration: BoxDecoration(
                      color:
                          Colors.red.withOpacity(0.1), // Light pink background
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
      body: Column(
        children: [
          // Tabs
          Container(
            padding: EdgeInsets.symmetric(horizontal: 6, vertical: 6),
            margin: EdgeInsets.symmetric(vertical: 5),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.6), // Light pink background
              // borderRadius: BorderRadius.circular(8),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 4, vertical: 2),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  tabItem("News Feed (20)",
                      selected: _selectedTabIndex == 0,
                      onTap: () => _onTabSelected(0)),
                  tabItem("Polls (01)",
                      selected: _selectedTabIndex == 1,
                      onTap: () => _onTabSelected(1)),
                  tabItem("Tasks (01)",
                      selected: _selectedTabIndex == 2,
                      onTap: () => _onTabSelected(2)),
                  tabItem("Events (01)",
                      selected: _selectedTabIndex == 3,
                      onTap: () => _onTabSelected(3)),
                ],
              ),
            ),
          ),
          Expanded(
            child: _buildTabContent(),
          ),
        ],
      ),
    );
  }

  Widget tabItem(String label,
      {required bool selected, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap, // Handle click
      child: Padding(
        padding: EdgeInsets.only(right: 2),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 11, vertical: 9),
          margin: EdgeInsets.symmetric(horizontal: 4),
          decoration: ShapeDecoration(
            color: selected
                ? tPrimaryColor
                : tPrimaryColor.withOpacity(0.1), // Highlight selected tab
            shape: SmoothRectangleBorder(
              borderRadius: SmoothBorderRadius(
                cornerRadius: isTab(context) ? 8 : 9,
                cornerSmoothing: 1.0,
              ),
            ),
          ),
          child: Text(
            label,
            style: GoogleFonts.manrope(
              fontWeight: FontWeight.w500,
              fontSize: 11,
              color: selected ? tWhite : tGray,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTabContent() {
    switch (_selectedTabIndex) {
      case 0:
        return Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: _controllers.length,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.symmetric(vertical: 1, horizontal: 0),
                decoration: BoxDecoration(
                  color: tWhite,
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
                    ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.brown,
                        backgroundImage: NetworkImage(
                            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTz0jx3eI5vppGWKkWiqe4gc18qKIF-Uxq7dA&s"),
                      ),
                      title: Text(
                        "SRP",
                        style: GoogleFonts.manrope(
                            color: tBlack,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w700),
                      ),
                      subtitle: Text(
                        "20 Mar 2025",
                        style: GoogleFonts.manrope(
                            color: tGray,
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w500),
                      ),
                      trailing: Icon(
                        Icons.more_vert,
                        color: tPrimaryColor,
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Major Rally for Farmers Rights in Delhi",
                            style: GoogleFonts.manrope(
                                color: tBlack,
                                fontSize: 9.sp,
                                fontWeight: FontWeight.w400),
                          ),
                          Text(
                            "Read More",
                            style: GoogleFonts.manrope(
                                color: tBlue,
                                fontSize: 9.sp,
                                fontWeight: FontWeight.w400),
                          ),
                          Text(
                            "#milestone #achievement ",
                            style: GoogleFonts.manrope(
                                color: tPrimaryColor,
                                fontSize: 9.sp,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 0.6.h,
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
                      padding: const EdgeInsets.symmetric(
                          horizontal: 22, vertical: 8),
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
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              margin: EdgeInsets.symmetric(horizontal: 4),
                              decoration: BoxDecoration(
                                color: Colors.white, // Light pink background
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Icon(
                                Icons.share_outlined,
                                color: tPrimaryColor,
                              )),
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
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 8),
                            margin: EdgeInsets.symmetric(horizontal: 4),
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.2),
                                  spreadRadius: 0,
                                  blurRadius: 1,
                                  offset: Offset(
                                      0, 1), // changes position of shadow
                                ),
                              ],
                              color: Colors.white, // Light pink background
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Row(
                              children: [
                                Icon(Icons.ads_click_outlined),
                                SizedBox(width: 4),
                                Text(
                                  "Full Video",
                                  style: GoogleFonts.manrope(
                                      color: tBlack,
                                      fontSize: 10.sp,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 8)
                  ],
                ),
              );
            },
          ),
        );
      case 1:
        return Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: _controllers.length,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.symmetric(vertical: 2, horizontal: 0),
                decoration: BoxDecoration(
                  color: tWhite,
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
                    ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.brown,
                        backgroundImage: NetworkImage(
                            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTz0jx3eI5vppGWKkWiqe4gc18qKIF-Uxq7dA&s"),
                      ),
                      title: Text(
                        "SRP",
                        style: GoogleFonts.manrope(
                            color: tBlack,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w700),
                      ),
                      subtitle: Text(
                        "20 Mar 2025",
                        style: GoogleFonts.manrope(
                            color: tGray,
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w500),
                      ),
                      trailing: Icon(
                        Icons.more_vert,
                        color: tPrimaryColor,
                      ),
                    ),

                     PollCard(
                            question:
                                QuationPolls[index],
                            options: [
                              "Yes",
                              "No",
                              // "Arvind Kejriwal",
                            ],
                            deadline: "April 15, 2025",
                          ),

                    Padding(
                      padding:   EdgeInsets.symmetric(
                          horizontal: 22, vertical: 8),
                      child: Row(
                        children: [
                          Text(
                            "45",
                            style: GoogleFonts.wixMadeforDisplay(
                                color: tGray,
                                fontSize: 9.sp,
                                fontWeight: FontWeight.w600),
                          ),
                          SizedBox(width: 4),
                          Text(
                            "Voted",
                            style: GoogleFonts.wixMadeforDisplay(
                                color: tGray,
                                fontSize: 9.sp,
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
                                fontSize: 9.sp,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 8)
                  ],
                ),
              );
            },
          ),
        );
      case 2:
        return Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: _controllers.length,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.symmetric(vertical: 5, horizontal: 0),
                decoration: BoxDecoration(
                  color: tWhite,
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
                    ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.brown,
                        backgroundImage: NetworkImage(
                            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTz0jx3eI5vppGWKkWiqe4gc18qKIF-Uxq7dA&s"),
                      ),
                      title: Text(
                        "SRP",
                        style: GoogleFonts.manrope(
                            color: tBlack,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w700),
                      ),
                      subtitle: Text(
                        "20 Mar 2025",
                        style: GoogleFonts.manrope(
                            color: tGray,
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w500),
                      ),
                      trailing: Icon(
                        Icons.more_vert,
                        color: tPrimaryColor,
                      ),
                    ),

                    _buildTaskCard(
                       QuationPaths[index], "12 May 2025", context),

                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 22, vertical: 8),
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

                    SizedBox(height: 8)
                  ],
                ),
              );
            },
          ),
        );
      case 3:
        return Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: _controllers.length,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.symmetric(vertical: 5, horizontal: 0),
                decoration: BoxDecoration(
                  color: tWhite,
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
                    ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.brown,
                        backgroundImage: NetworkImage(
                            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTz0jx3eI5vppGWKkWiqe4gc18qKIF-Uxq7dA&s"),
                      ),
                      title: Text(
                        "SRP",
                        style: GoogleFonts.manrope(
                            color: tBlack,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w700),
                      ),
                      subtitle: Text(
                        "20 Mar 2025",
                        style: GoogleFonts.manrope(
                            color: tGray,
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w500),
                      ),
                      trailing: Icon(
                        Icons.more_vert,
                        color: tPrimaryColor,
                      ),
                    ),

                    _buildEventCard(
                        "Fee Reimbursement Protest",
                        "20 May 2025, 10:00 AM",
                        "Hyderabad, TG",
                        "2500+ Confirmed"),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 22, vertical: 8),
                      child: Row(
                        children: [
                          Text(
                            "45",
                            style: GoogleFonts.wixMadeforDisplay(
                                color: tGray,
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w600),
                          ),
                          SizedBox(width: 4),
                          Text(
                            "Joined",
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

                    SizedBox(height: 8)
                  ],
                ),
              );
            },
          ),
        );
      default:
        return Center(
            child: Text("Unknown Tab",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)));
    }
  }
}

class PollCard extends StatefulWidget {
  final String question;
  final List<String> options;
  final String deadline;

  const PollCard({
    Key? key,
    required this.question,
    required this.options,
    required this.deadline,
  }) : super(key: key);

  @override
  State<PollCard> createState() => _PollCardState();
}

class _PollCardState extends State<PollCard> {
  String? _selectedOption;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 0, horizontal: 20),
      padding: EdgeInsets.only(top: 10, bottom: 16, left: 16, right: 16),

      decoration: ShapeDecoration(
        color: Colors.grey.withOpacity(0.1),
        // shadows: [tButtonBoxShadow],
        shape: SmoothRectangleBorder(
          borderRadius: SmoothBorderRadius(
            cornerRadius: isTab(context) ? 10 : 16,
            cornerSmoothing: 1.0,
          ),
        ),
      ),
      // decoration: BoxDecoration(
      //   color: Colors.grey.withOpacity(0.1),
      //   borderRadius: BorderRadius.circular(16),
      // ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.question,
            style: GoogleFonts.manrope(
              color: tBlack,
              fontSize: 12.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 10),
          ...widget.options.map(
            (option) => RadioListTile(
              contentPadding: EdgeInsets.zero,
              dense: true,
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              visualDensity: VisualDensity.compact,
              title: Text(
                option,
                style: GoogleFonts.manrope(
                  color: tBlack,
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              value: option,
              groupValue: _selectedOption,
              onChanged: (value) {
                setState(() {
                  _selectedOption = value.toString();
                });
              },
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(Icons.access_time, size: 16, color: tGray),
                  SizedBox(width: 4),
                  Text(
                    "Deadline : ${widget.deadline}",
                    style: GoogleFonts.manrope(
                      color: tGray,
                      fontSize: 9.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 4.h,
                child: ElevatedButton(
                  onPressed: () {
                    if (_selectedOption != null) {
                      // Handle vote submission
                    }
                  },
                  child: Text(
                    "Submit Vote",
                    style: GoogleFonts.manrope(
                      color: tWhite,
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    backgroundColor: tPrimaryColor,
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

Widget _buildTaskCard(String title, String deadline, BuildContext context) {
  return
  
   Container(
    margin: EdgeInsets.symmetric(vertical: 0, horizontal: 20),
    padding: EdgeInsets.all(16),
    decoration: ShapeDecoration(
      color: Colors.blue.withOpacity(0.1),
      // shadows: [tButtonBoxShadow],
      shape: SmoothRectangleBorder(
        borderRadius: SmoothBorderRadius(
          cornerRadius: 16,
          cornerSmoothing: 1.0,
        ),
      ),
    ),
    // decoration: BoxDecoration(
    //   color: Colors.blue.withOpacity(0.1),
    //   borderRadius: BorderRadius.circular(16),
    // ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.manrope(
              color: tBlack, fontSize: 12.sp, fontWeight: FontWeight.w800),
        ),
        SizedBox(height: 6),
        Row(
          children: [
            Icon(Icons.access_time, size: 16),
            SizedBox(width: 4),
            Text(
              "Deadline: $deadline",
              style: GoogleFonts.manrope(
                  color: tGray, fontSize: 10.sp, fontWeight: FontWeight.w500),
            )
          ],
        ),
        SizedBox(height: 2.h),
        Center(
          child: SizedBox(
            width: 200,
            height: 4.h,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyTasksScreen(),
                  ),
                );
              },
              child: Text(
                "Accept Task",
                style: GoogleFonts.manrope(
                    color: tWhite,
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w700),
              ),
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  backgroundColor: tSecondaryGreen),
            ),
          ),
        ),
      ],
    ),
  );
}

Widget _buildEventCard(
    String title, String dateTime, String location, String attendees) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
    padding: EdgeInsets.all(16),
    decoration: ShapeDecoration(
      gradient: LinearGradient(
        begin: Alignment(-0.15, 0.00),
        end: Alignment(1.28, 1.20),
        colors: [
          const Color(0xFFFF006E).withOpacity(0.05),
          const Color(0xFFFFBE0B).withOpacity(0.05),
          const Color(0xFFFF006E).withOpacity(0.05),
        ],
      ),
      // color: tPrimaryColor,
      // shadows: [tButtonBoxShadow],
      shape: SmoothRectangleBorder(
        borderRadius: SmoothBorderRadius(
          cornerRadius: 16,
          cornerSmoothing: 1.0,
        ),
      ),
    ),
    // decoration: BoxDecoration(
    // gradient: LinearGradient(
    //   begin: Alignment(-0.15, 0.00),
    //   end: Alignment(1.28, 1.20),
    //   colors: [
    //     const Color(0xFFFF006E).withOpacity(0.05),
    //     const Color(0xFFFFBE0B).withOpacity(0.05),
    //     const Color(0xFFFF006E).withOpacity(0.05),
    //   ],
    // ),
    //   borderRadius: BorderRadius.circular(16),
    // ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
        SizedBox(height: 8),
        Row(children: [
          Icon(Icons.access_time, size: 16),
          SizedBox(width: 6),
          Text(dateTime)
        ]),
        SizedBox(height: 6),
        Row(children: [
          Icon(Icons.location_on, size: 16),
          SizedBox(width: 6),
          Text(location)
        ]),
        SizedBox(height: 6),
        Row(children: [
          Icon(Icons.people, size: 16),
          SizedBox(width: 6),
          Text(attendees)
        ]),
        SizedBox(height: 2.h),
        Container(
          height: 4.h,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0XFFA855F7),
                Color(0XFFEC4899)
              ], // Customize your gradient colors
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 0),
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: Text(
              "Join Event",
              style: GoogleFonts.manrope(
                  color: tWhite, fontWeight: FontWeight.w600),
            ),
          ),
        )
      ],
    ),
  );
}
