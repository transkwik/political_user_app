//Suyog
// import 'package:argon_buttons_flutter/argon_buttons_flutter.dart';

// import 'package:NXT_School_managment_teacher_parent/constants/imageConstant.dart';

// import 'package:NXT_School_managment_teacher_parent/globalFuctions/globalFunctions.dart';
// import 'package:NXT_School_managment_teacher_parent/globalWidgets/button.dart';
// import 'package:NXT_School_managment_teacher_parent/globalWidgets/text_widget.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';

import 'dart:ui';

import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:ysrct_political/basic_details_screen/basic_details_screen.dart';
import 'package:ysrct_political/bottomnavigation.dart';
import 'package:ysrct_political/button.dart';
import 'package:ysrct_political/constants/imageConstant.dart';
import 'package:ysrct_political/text_widget.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import '../../api_services/userApi.dart';
import '../../constants/constants.dart';
import 'package:sizer/sizer.dart';
// import 'package:device_info_plus/device_info_plus.dart';
import '../../responsive.dart';
// import '../choose_student_card/choose_studentcard.dart';

class AppTypeScreen extends StatefulWidget {
  AppTypeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<AppTypeScreen> createState() => _AppTypeScreenState();
}

class _AppTypeScreenState extends State<AppTypeScreen> {
  final TextEditingController _otpCodeController = TextEditingController();

  final _formKey = new GlobalKey<FormState>();

  @override
  @override
  void dispose() {
    super.dispose();
  }

  int secondsRemaining = 30;
  bool enableResend = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                Images.dIFFREBACKGROUND,
              ),
              fit: BoxFit.fill)),
       
      child: Scaffold(
        backgroundColor: Colors.transparent,
        resizeToAvoidBottomInset: true,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 40, sigmaY: 40),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.8),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                          SizedBox(
                          height: 1.h,
                        ),
                        Text(
                          "I want to work as...",
                          style: GoogleFonts.manrope(
                            color: tBlack,
                            fontSize: isTab(context) ? 12.sp : 13.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Row(
                          children: [
                            Flexible(
                              flex: 6,
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => DetailsJoinTheRevolution()
                                        // BottomNavigation()
              
                                        ),
                                  );
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(vertical: 20),
                                  // height: 15.h,
                                  width: double.infinity,
                                    decoration: ShapeDecoration(
                                    color: tWhite,
                                    shadows: [tBoxShadow],
                                    shape: SmoothRectangleBorder(
                                      borderRadius: SmoothBorderRadius(
                                        cornerRadius: isTab(context) ? 10 : 25,
                                        cornerSmoothing: 1.0,
                                      ),
                                    ),
                                  ),
                                  // decoration: BoxDecoration(
                                  //     color: tWhite,
                                  //     boxShadow: [tBoxShadow],
                                  //     borderRadius:
                                  //         BorderRadius.circular(25)),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.center,
                                    children: [
                                        SizedBox(
                          height: 2.h,
                        ),
                                      Image.asset(
                                        Images.PARTY_VERCORE,
                                        height: isTab(context) ? 70 : 70,
                                      ),
                                      SizedBox(
                                        height: 2.h,
                                      ),
                                      Text(
                                        "Party Worker",
                                        style: GoogleFonts.manrope(
                                          color: tPrimaryColor,
                                          fontSize:
                                              isTab(context) ? 12.sp : 14.sp,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            Flexible(
                              flex: 6,
                              child: GestureDetector(
                                onTap: () {
                                  print("object");
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => DetailsJoinTheRevolution()
                                        // BottomNavigation()
              
                                        ),
                                  );
                                  // MaterialPageRoute(
                                  //     builder: (context) => BottomAppBar());
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(vertical: 20),
                                  width: double.infinity,
                                   decoration: ShapeDecoration(
                                    color: tWhite,
                                    shadows: [tBoxShadow],
                                    shape: SmoothRectangleBorder(
                                      borderRadius: SmoothBorderRadius(
                                        cornerRadius: isTab(context) ? 10 : 25,
                                        cornerSmoothing: 1.0,
                                      ),
                                    ),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.center,
                                    children: [
                                        SizedBox(
                          height: 2.h,
                        ),
                                      Image.asset(
                                        Images.PARTY_Volunteer,
                                        height: isTab(context) ? 70 : 70,
                                        // width: isTab(context) ? 5 : 5,
                                      ),
                                      SizedBox(
                                        height: 2.h,
                                      ),
                                      Text(
                                        "Volunteer",
                                        style: GoogleFonts.manrope(
                                          color: tPrimaryColor,
                                          fontSize:
                                              isTab(context) ? 12.sp : 14.sp,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                          SizedBox(
                          height: 3.h,
                        ),
                     SizedBox(
                      height: 16.h,
                       child: Image(image: AssetImage(
                       
                        Images.MAINTYETEXTBACKGROUND
                       )),
                     )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
