// import 'dart:ffi';

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../constants/constants.dart';
import '../constants/imageConstant.dart';
import '../responsive.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.red.withOpacity(0.2),
                     Colors.blue.withOpacity(0.1),
                Colors.red.withOpacity(0.1),
                Colors.blue.withOpacity(0.1),
                Colors.red.withOpacity(0.1),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              children: [
                SizedBox(
                  height: 4.h,
                ),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                          padding:
                              EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                          decoration: BoxDecoration(
                            color: tWhite.withOpacity(0.4),
                            boxShadow: [tBoxShadow],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Icon(
                            Icons.arrow_back_ios_new_rounded,
                            color: tBlack,
                            size: 18,
                          )),
                    )
                  ],
                ),
                SizedBox(
                  height: 8.h,
                ),
                Stack(
                  alignment: Alignment.topCenter,
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 6.h, bottom: 2.h),
                      // height: .h,
                      decoration: BoxDecoration(
                          // boxShadow: [tBoxShadow],
                          // border: Border.all(color: tWhite, width: 2),
                          color: tWhite.withOpacity(0.8),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(35),
                              bottomLeft: Radius.circular(35),
                              bottomRight: Radius.circular(35),
                              topRight: Radius.circular(35))),
                      width: double.infinity,
                      child: Column(
                        children: [
                          Text(
                            "Sujith Reddy",
                            style: GoogleFonts.amaranth(
                                color: tPrimaryColor,
                                fontSize: isTab(context) ? 12.sp : 14.sp,
                                fontWeight: FontWeight.w800),
                          ),
                          Text("+91 98765XXXXX",
                              style: GoogleFonts.mulish(
                                  color: tGray,
                                  fontSize: isTab(context) ? 8.sp : 10.sp,
                                  fontWeight: FontWeight.w600)),
                          Text("Joined Date : 02 Jan 2025",
                              style: GoogleFonts.mulish(
                                  color: tGray,
                                  fontSize: isTab(context) ? 6.sp : 8.sp,
                                  fontWeight: FontWeight.w600))
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 90.0,
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: CircleAvatar(
                          maxRadius: 54,
                          backgroundColor: tWhite,
                          child: CircleAvatar(
                            maxRadius: 52,
                            backgroundColor: tWhite,
                            child: CircleAvatar(
                              maxRadius: 50,
                              backgroundColor: tWhite,
                              backgroundImage: NetworkImage(
                                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQksR3Lt2Iy2rlmUKvJmc27GcXpe297gINhTA&s"),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 2.h,
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  decoration: BoxDecoration(
                      color: tWhite, borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MenuItem(
                          icon: Images.LOGOUTIOCN,
                          title: 'Mylavaram  Constituency'),
                      MenuItem(icon: Images.About, title: 'My Leaders'),
                      MenuItem(icon: Images.About, title: 'Suggestions'),
                    ],
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 10),
                  decoration: BoxDecoration(
                      color: tWhite, borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //       // builder: (context) => BuyGiftCouponPage()
                          //       builder: (context) => MyMealCouponScreen()
                          //       // BottomNavigation()

                          //       ),
                          // );
                        },
                        child: MenuItem(
                            icon: Images.cashtarnsits, title: 'Wallpapers'),
                      ),
                      GestureDetector(
                          onTap: () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //       // builder: (context) => BuyGiftCouponPage()
                            //       builder: (context) => MySavingScreen()
                            //       // BottomNavigation()

                            //       ),
                            // );
                          },
                          child: MenuItem(
                              icon: Images.cashtarnsits, title: 'Audio Songs')),
                      MenuItem(icon: Images.Favorite, title: 'Video Songs'),
                      GestureDetector(
                        onTap: () {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //       builder: (context) => SelectAdCategoryScreen()
                          //       // BottomNavigation()

                          //       ),
                          // );
                        },
                        child: MenuItem(
                            icon: Images.cashtarnsits, title: 'Merchandise'),
                      ),
                      GestureDetector(
                        onTap: () {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //       builder: (context) => BuyGiftCouponPage()
                          //       // builder: (context) => GiftCouponPage()
                          //       // BottomNavigation()

                          //       ),
                          // );
                        },
                        child: MenuItem(
                            icon: Images.cashtarnsits,
                            title: 'Publicity Material'),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  decoration: BoxDecoration(
                      color: tWhite, borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MenuItem(icon: Images.About, title: 'Help'),
                    ],
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  decoration: BoxDecoration(
                      color: tWhite, borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MenuItem(icon: Images.About, title: 'About Us'),
                      MenuItem(icon: Images.About, title: 'Terms & Condition'),
                      MenuItem(icon: Images.About, title: 'Privacy Policy'),
                    ],
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                GestureDetector(
                  onTap: () {
                    showLogoutConfirmation(context);
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: 27,
                        vertical: 12), // Add padding for better spacing
                    decoration: BoxDecoration(
                      // border: Border.all(color: tWhite, width: 2),
                      color: tWhite,
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize
                          .min, // This makes it take only necessary space
                      children: [
                        Image(
                          height: 25,
                          image: AssetImage(
                            Images.LOGOUTIOCN,
                          ),
                          color: tPrimaryColor,
                        ),
                        SizedBox(
                            width: 5), // Increase space for better readability
                        Text(
                          "Logout",
                          style: GoogleFonts.inter(
                            color: tBlack,
                            fontSize: isTab(context) ? 8.sp : 10.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MenuItem extends StatelessWidget {
  final String icon;
  final String title;

  MenuItem({required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      child: Container(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset(icon, width: 20, height: 20),
                SizedBox(width: 15),
                Text(
                  title,
                  style: GoogleFonts.mulish(
                    color: tBlack,
                    fontSize: isTab(context) ? 9.sp : 11.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            Icon(size: 15, Icons.arrow_forward_ios_outlined), // Show
          ],
        ),
      ),
    );
  }
}

void showLogoutConfirmation(BuildContext context) {
  showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
    ),
    backgroundColor: Colors.white,
    builder: (context) => LayoutBuilder(
      builder: (context, constraints) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Text(
                    'Log Out?',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[800],
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Are you sure you want to log out?',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[600],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            const Divider(height: 1),
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.red),
              title: const Text('Log Out',
                  style: TextStyle(
                      color: Colors.red, fontWeight: FontWeight.bold)),
              onTap: () {
                Navigator.pop(context); // Close bottom sheet
                // _performLogout(context); // Implement your logout logic
              },
            ),
            ListTile(
              leading: const Icon(Icons.cancel_outlined, color: Colors.grey),
              title: const Text('Cancel', style: TextStyle(color: Colors.grey)),
              onTap: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
    ),
  );
}
