import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:ysrct_political/Report_Crime_or_Extortion_screen/ReportCrimeorExtortion.dart';
import 'package:ysrct_political/constants/constants.dart';
import 'package:ysrct_political/constants/imageConstant.dart';
import 'package:ysrct_political/notification_screen/notification_screen.dart';
import 'package:ysrct_political/profile_screen/profile_screen.dart';
import 'package:ysrct_political/responsive.dart';

class PostersPage extends StatefulWidget {
  const PostersPage({Key? key}) : super(key: key);

  @override
  State<PostersPage> createState() => _PostersPageState();
}

class _PostersPageState extends State<PostersPage> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  final List<String> posters = [
    Images.POSTER3,
    Images.POSTER2,
    Images.POSTER1,
    // Images.POSTER1,
    Images.POSTER5,
    Images.POSTER4,
  ];

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
    
      body: ListView.builder(
                itemCount: 5, // Replace with your item count
                itemBuilder: (BuildContext context, int index) {
      return Container(
              margin: EdgeInsets.symmetric(vertical: 2),
              decoration: BoxDecoration(
                color: tWhite
              ),
              child: Column(
        children: [
          Container(
            
            height: 55.h,
            child:  Container(
                  
                    decoration: BoxDecoration(
                 
                      image: DecorationImage(
                        image: AssetImage(posters[index]),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
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
                            color: tPrimaryColor, // Light pink background
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            children: [
                              Icon(Icons.download_for_offline_outlined,color: tWhite,),
                              
                            
                            ],
                          ),
                        ),
                            Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 8),
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
                              Icon(Icons.share_outlined,color: tPrimaryColor,),
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
                 SizedBox(height: 3.h),
        ],
      ),
      );
      }  ),
    );
  }
}
