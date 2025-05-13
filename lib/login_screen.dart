// import 'package:NXT_School_managment_teacher_parent/constants/imageConstant.dart';

// import 'package:NXT_School_managment_teacher_parent/globalFuctions/globalFunctions.dart';
// import 'package:NXT_School_managment_teacher_parent/globalWidgets/button.dart';
// import 'package:NXT_School_managment_teacher_parent/globalWidgets/text_widget.dart';
// import 'package:NXT_School_managment_teacher_parent/views/otpPage/otpPage.dart';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ysrct_political/constants/imageConstant.dart';
import 'package:ysrct_political/otp_screen.dart';
import 'package:ysrct_political/text_widget.dart';
// import '../../api_services/userApi.dart';
import '../../constants/constants.dart';
import 'package:sizer/sizer.dart';

import '../../responsive.dart';
import 'button.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernumbercontroller = TextEditingController();

  final _formKey = new GlobalKey<FormState>();

  late String username;

  bool hasError = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
      color: tWhite,
                  image: DecorationImage(image: AssetImage(Images.LOGINBACKGROUND,),fit: BoxFit.fill)
                ),
      child: Scaffold(
           resizeToAvoidBottomInset: true,
          backgroundColor: Colors.transparent,
          // appBar: AppBar(
          //   scrolledUnderElevation: 0.0,
          //   backgroundColor: Colors.transparent,
          //   elevation: 0,
          //   leading: GestureDetector(
          //     onTap: () {
          //       // Estu.navigateBack(context);
          //     },
          //     child: Image.asset(
          //       Images.BACK,
          //       scale: isTab(context) ? 3.5 : 4,
          //     ),
          //   ),
          // ),
      
          body: Stack(
            children: [
             
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ClipRRect(
                      borderRadius:   BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.8),
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30),
                            ),
                          ),
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Welcome To..!".tr,
                                    style: GoogleFonts.amaranth(
                                      color: tBlack,
                                      fontSize: isTab(context) ? 12.sp : 12.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text(
                                    "YSRCP",
                                    style: GoogleFonts.amaranth(
                                      color: tPrimaryColor,
                                      fontSize: isTab(context) ? 20.sp : 22.sp,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                  Text(
                                    "Hand in Hand, Jagan for 2029!".tr,
                                    style: GoogleFonts.wixMadeforDisplay(
                                      color: tGray,
                                      fontSize: isTab(context) ? 12.sp : 12.sp,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                  // TextWidget(
                                  //     text: "Your child's journey starts here.".tr,
                                  //     color: tBlack,
                                  //     fontSize: isTab(context) ? 12.sp : 12.sp,
                                  //     fontWeight: FontWeight.w700),
                                  SizedBox(
                                    height: 1.2.h,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 2.5.h,
                                      ),
                                      TextWidget(
                                          text: "Mobile Number".tr,
                                          color: tBlack,
                                          fontSize: isTab(context) ? 10.sp : 11.sp,
                                          fontWeight: FontWeight.w600),
                                      SizedBox(
                                        height: 1.h,
                                      ),
                                      Container(
                                        // decoration: BoxDecoration(
                                        //     // color: tWhite,
                                        //     borderRadius: BorderRadius.circular(10),
                                        //     boxShadow: [tBoxShadow]),
                                        child: TextFormField(
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return "Mobile number cant be empty"
                                                  .tr;
                                            } else if (value.length != 10 &&
                                                value.length < 10) {
                                              return 'Mobile number must be 10 digits'
                                                  .tr;
                                            } else {
                                              return null;
                                            }
                                          },
                                          controller: _usernumbercontroller,
                                          keyboardType: TextInputType.number,
                                          style: TextStyle(
                                              fontSize:
                                                  isTab(context) ? 12.sp : 14.sp),
                                          inputFormatters: <TextInputFormatter>[
                                            FilteringTextInputFormatter.allow(
                                                RegExp(
                                              "[0-9]",
                                            )),
                                            LengthLimitingTextInputFormatter(10),
                                          ],
                                          decoration: InputDecoration(
                                            hintText: 'Enter Mobile Number',
                                            prefixIcon: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                SizedBox(
                                                  width: isTab(context) ? 3.w : 3.w,
                                                ),
                                                Row(
                                                  children: [
                                                    Text("+91"),
                                                    Icon(
                                                      Icons.arrow_drop_down_rounded,
                                                      color: tPrimaryColor,
                                                    )
                                                  ],
                                                ),
                                                Image.asset(
                                                  Images.VERTICLE,
                                                  height: isTab(context) ? 30 : 30,
                                                  width: isTab(context) ? 5 : 5,
                                                  color: tlightGray,
                                                ),
                                                SizedBox(
                                                  width: isTab(context) ? 2.w : 2.w,
                                                ),
                                              ],
                                            ),
                                            hintStyle: TextStyle(
                                                fontSize:
                                                    isTab(context) ? 8.sp : 11.sp,
                                                color: tGray,
                                                fontFamily: 'Manrope',
                                                fontWeight: FontWeight.w500),
                                            fillColor: tWhite.withOpacity(0.2),
                                            filled: true,
                                            border: OutlineInputBorder(
                                              borderSide:  BorderSide(
                                                color: tGray.withOpacity(1),
                                                width:
                                                   0.5, // Set the width of the border when focused
                                              ), 
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(12.0),
                                                
                                              ),
                                            ),
                                            contentPadding:
                                                EdgeInsets.symmetric(vertical: 10),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: tGray.withOpacity(1),
                                                width:
                                                   0.5, // Set the width of the border when focused
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color:
                                                      tGray.withOpacity(1),
                                                  width:0.5),
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                            ),
                                            disabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color:
                                                      tGray.withOpacity(1),
                                                  width: 0.5),
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: isTab(context) ? 1.h : 1.h),
                                    ],
                                  ),
                              
                                  SizedBox(
                                    height: isTab(context) ? 4.h : 4.h,
                                  ),
                                  Center(
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: isTab(context) ? 0 : 0),
                                      child: Container(
                                        margin: EdgeInsets.symmetric(
                                            horizontal: isTab(context) ? 15 : 25),
                                        child: Button(
                                            height: 5.4.h,
                                            // height:  "20",
                                            width: isTab(context) ? 100.w : 60.w,
                                           
                                            textcolor: tWhite,
                                            bottonText: 'Get OTP'.tr,
                                            onTap: (startLoading, stopLoading,
                                                btnState) async {
                                              startLoading();
                              
                                              if (_formKey.currentState!
                                                  .validate()) {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          OtpPage()
                                                     
                              
                                                      ),
                                                );
                                              }
                                              stopLoading();
                                            }),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: isTab(context) ? 1.h : 1.h,
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Proudly crafted with ".tr.tr,
                                    style: GoogleFonts.redHatDisplay(
                                        color: tPrimaryGray,
                                        fontWeight: FontWeight.w600,
                                        fontSize: isTab(context) ? 7.sp : 8.sp),
                                  ),
                                  Icon(Icons.favorite,
                                      color: Colors.red,
                                      size: isTab(context) ? 16.sp : 16.sp),
                                  Text(
                                    " in Hyderabad, India".tr.tr,
                                    style: GoogleFonts.redHatDisplay(
                                        color: tPrimaryGray,
                                        fontWeight: FontWeight.w600,
                                        fontSize: isTab(context) ? 7.sp : 8.sp),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
