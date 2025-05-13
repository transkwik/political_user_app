//Suyog
// import 'package:argon_buttons_flutter/argon_buttons_flutter.dart';
import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'dart:ui';

// import 'package:NXT_School_managment_teacher_parent/constants/imageConstant.dart';

// import 'package:NXT_School_managment_teacher_parent/globalFuctions/globalFunctions.dart';
// import 'package:NXT_School_managment_teacher_parent/globalWidgets/button.dart';
// import 'package:NXT_School_managment_teacher_parent/globalWidgets/text_widget.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:ysrct_political/app_type_screen.dart';
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

class OtpPage extends StatefulWidget {
  OtpPage({
    Key? key,
  }) : super(key: key);

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
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
        color: tWhite,
          image: DecorationImage(
              image: AssetImage(
                Images.OTPBACKGROUND,
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
                  filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "OTP Verification",
                          style: GoogleFonts.amaranth(
                            color: tPrimaryColor,
                            fontSize: isTab(context) ? 20.sp : 24.sp,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        TextWidget(
                            text: "Enter the OTP sent to your mobile".tr,
                            color: tBlack,
                            fontSize: isTab(context) ? 10.sp : 12.sp,
                            fontWeight: FontWeight.w500),
                        TextWidget(
                            text: '+919284518889',
                            color: tPrimaryGray,
                            fontSize: isTab(context) ? 10.sp : 12.sp,
                            fontWeight: FontWeight.w600),

                        SizedBox(
                          height: 6.h,
                        ),
                        SizedBox(
                          child: Form(
                            key: _formKey,
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: isTab(context) ? 15.w : 23,
                              ),
                              child: PinCodeTextField(
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.allow(
                                      RegExp("[0-9]")),
                                  LengthLimitingTextInputFormatter(4),
                                ],
                                //backgroundColor: Colors.white,
                                appContext: context,
                                pastedTextStyle: TextStyle(
                                  color: tBlack,
                                  fontWeight: FontWeight.bold,
                                ),
                                textStyle: TextStyle(
                                    fontSize: isTab(context) ? 12.sp : 15.sp),
                                length: 4,
                                obscureText: false,
                                obscuringCharacter: '*',

                                blinkWhenObscuring: true,
                                animationType: AnimationType.fade,
                                validator: (v) {
                                  if (v!.length < 4 || v.length == 0) {
                                    return "OTP length did not match".tr;
                                  } else {
                                    return null;
                                  }
                                },
                                pinTheme: PinTheme(
                                  borderWidth: 0,
                                  shape: PinCodeFieldShape.box,
                                  activeColor: Color.fromARGB(0, 243, 216,
                                      216), // No border color for active field
                                  selectedColor: Colors
                                      .transparent, // No border color for selected field
                                  inactiveColor: Colors
                                      .transparent, // No border color for inactive field
                                  selectedFillColor:
                                      Color.fromRGBO(91, 111, 86, 0.094),
                                  activeFillColor:
                                      Color.fromRGBO(91, 111, 86, 0.094),
                                  inactiveFillColor:
                                      Color.fromRGBO(91, 111, 86, 0.094),
                                  borderRadius: BorderRadius.circular(12),
                                  fieldHeight: isTab(context) ? 8.w : 12.w,
                                  fieldWidth: isTab(context) ? 8.w : 12.w,
                                  // activeFillColor: hasError
                                  //     ? Colors.white
                                  //     : Color.fromRGBO(38, 97, 27, 0.1),
                                ),

                                cursorColor: Colors.black,
                                // animationDuration: Duration(milliseconds: 300),
                                enableActiveFill: true,
                                //errorAnimationController: errorController,
                                controller: _otpCodeController,
                                keyboardType: TextInputType.number,
                                onCompleted: (v) {
                                  print("Completed");
                                },
                                onTap: () {
                                  print("Pressed");
                                },
                                onChanged: (value) {
                                  print(value);
                                  // setState(() {
                                  //   currentText = value;
                                  // });
                                },
                                beforeTextPaste: (text) {
                                  print("Allowing to paste $text");

                                  return true;
                                },
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextWidget(
                                text: "Don't receive the code ? ".tr,
                                color: tBlack,
                                fontWeight: FontWeight.w500,
                                fontSize: isTab(context) ? 7.sp : 9.sp),
                            SizedBox(
                              height: 6.h,
                            ),
                            Container(
                              child: InkWell(
                                onTap: enableResend
                                    ? () async {
                                        // username = widget.mobileNum;
                                        // print(username);
                                        // var res = await UserAPI()
                                        //     .sendOtp(context,
                                        //         widget.mobileNum);
                                        // log(res.toString());

                                        // _resendCode();
                                      }
                                    : null,
                                child: enableResend
                                    ? Container(
                                        // padding: EdgeInsets.symmetric(
                                        //     horizontal: 0, vertical: 2),
                                        // decoration: BoxDecoration(
                                        //     // color: tGreen2,
                                        //     borderRadius:
                                        //         BorderRadius.circular(
                                        //             4)),
                                        child: TextWidget(
                                            text: 'resend'.tr,
                                            textAlign: TextAlign.center,
                                            fontWeight: FontWeight.w600,
                                            color: tGray,
                                            fontSize:
                                                isTab(context) ? 7.sp : 7.sp),
                                      )
                                    : TextWidget(
                                        text: 'Resend ($secondsRemaining s)'.tr,
                                        fontWeight: FontWeight.w600,
                                        color: tGray,
                                        fontSize: isTab(context) ? 7.sp : 9.sp,
                                        textAlign: TextAlign.center,
                                      ),
                              ),
                            ),
                          ],
                        ),

                        SizedBox(
                          height: 3.h,
                        ),
                        Center(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: isTab(context) ? 0 : 0),
                            child: Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: isTab(context) ? 15 : 25),
                              // height: isTab(context) ? 70 : 50,
                              // width: isTab(context) ? 100.w : 100.w,
                              child: Button(
                                  height: 5.4.h,
                                  // height:  "20",
                                  width: isTab(context) ? 100.w : 60.w,
                                  textcolor: tWhite,
                                  bottonText: 'Verify OTP'.tr,
                                  onTap: (startLoading, stopLoading,
                                      btnState) async {
                                    if (_formKey.currentState!.validate()) {
                                      startLoading();
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                AppTypeScreen()),
                                      );
                                      stopLoading();
                                    }
                                  }),
                            ),
                          ),
                        ),

                        // SizedBox(height: 0.5.h,),
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
