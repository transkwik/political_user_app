// import 'package:NXT_School_managment_teacher_parent/constants/constants.dart';
// import 'package:NXT_School_managment_teacher_parent/globalWidgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:loading_icon_button/loading_icon_button.dart';
import 'package:sizer/sizer.dart';
import 'package:ysrct_political/constants/constants.dart';
import 'package:ysrct_political/text_widget.dart';
import '../responsive.dart';

class Button extends StatelessWidget {
  const Button({
    Key? key,
    this.color,
    this.bottonText,
    this.onTap,
    this.borderSide,
    this.width,
    this.height,
    this.textcolor,
    this.borderRadius,
  }) : super(key: key);
  final color;
  final String? bottonText;
  final onTap;
  final borderSide;
  final textcolor;
  final width;
  final height;
  final borderRadius;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: EdgeInsets.only(
            right: isDesktop(context) ? 0 : 0,
            bottom: isDesktop(context) ? 0 : 0),
        child: Container(
          decoration: BoxDecoration(
             gradient: LinearGradient(
              colors: [
                Color(0XFF14549B),
                Color(0XFF137DF3),
                  Color(0XFF2765AA),
              ],
              begin: Alignment. centerLeft,
              end: Alignment.centerRight,
            ),  
            // color: Colors
            //     .transparent, // Ensure container's color is transparent to see shadow
            borderRadius: BorderRadius.circular(borderRadius == null
                ? (isDesktop(context) ? 6 : 16)
                : borderRadius!),
            // boxShadow: [tButtonBoxShadow],
          ),
          child: ArgonButton(
            height: height == null
                ? isDesktop(context)
                    ? 6.h
                    : isTab(context)
                        ? 4.h
                        : 5 .h
                : height,
            width: width == null
                ? isDesktop(context)
                    ? 12.w
                    : isTab(context)
                        ? 100.w
                        : 76.w
                : width,
            color: color,
            borderRadius: borderRadius == null
                ? isDesktop(context)
                    ? 6
                    : 15
                : borderRadius,
            // borderSide: borderSide,
            child: TextWidget(
                text: bottonText!,
                color: textcolor,
                fontWeight: FontWeight.w600,
                fontSize: isDesktop(context)
                    ? 3.5.sp
                    : isTab(context)
                        ? 10.sp
                        : 13.sp),
            loader: Container(
              padding: EdgeInsets.all(10),
              child: SpinKitRotatingCircle(
                color: Colors.white,
                // size: loaderWidth ,
              ),
            ),
            onTap: onTap,
          ),
        ),
      ),
    );
  }
}

class GlobalButton extends StatefulWidget {
  GlobalButton({
    required this.buttonWidth,
    required this.buttonHeight,
    required this.onTap,
    required this.title,
    this.btnType = 'default',
    this.disableButton,
  });
  final double buttonWidth;
  final double buttonHeight;
  String btnType;
  final onTap;
  final title;
  final disableButton;
  @override
  State<GlobalButton> createState() => _GlobalButtonState();
}

class _GlobalButtonState extends State<GlobalButton> {
  @override
  Widget build(BuildContext context) {
    var isBtnTypeDefault = widget.btnType == 'default';
    return Container(
      decoration: BoxDecoration(
          // boxShadow: [
          //   BoxShadow(
          //     color: Color(0x99FF7A30),
          //     blurRadius: 10,
          //     offset: Offset(1, 3),
          //     spreadRadius: 0,
          //   ),
          // ],
          ),
      child: ArgonButton(
        width: widget.buttonWidth,
        height: widget.buttonHeight,
        borderRadius: 20.0,
        elevation: 0,
        color: widget.disableButton == 'yes'
            ? Color.fromARGB(213, 179, 133, 180)
            : Color.fromARGB(215, 134, 37, 135), // Set color to transparent
        onTap: widget.onTap,
        loader: Container(
          padding: EdgeInsets.all(10),
          child: SpinKitRotatingCircle(
            color: tWhite,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            gradient: widget.disableButton == 'yes' ? null : tGradient,
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                widget.title,
                style: TextStyle(
                  color: tWhite,
                  fontSize: isTab(context) ? 8.sp : 14.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}



// import 'package:argon_buttons_flutter/argon_buttons_flutter.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'package:sizer/sizer.dart';

// import '../constants/constants.dart';
// import '../responsive.dart';

// class Button extends StatelessWidget {
//   const Button({
//     Key? key,
//     this.color,
//     this.bottonText,
//     this.onTap,
//     this.borderSide,
//     this.textcolor,
//   }) : super(key: key);
//   final color;
//   final String? bottonText;
//   final onTap;
//   final borderSide;
//   final textcolor;

//   @override
//   Widget build(BuildContext context) {
//     return ArgonButton(
//       height: isTab(context) ? 70 : 50,
//       width: 100.w,
//       color: color,
//       borderRadius: 10,
//       borderSide: borderSide,
//       child: Text(
//         bottonText!,
//         style: TextStyle(
//             color: textcolor,
//             fontWeight: FontWeight.w600,
//             fontSize: isTab(context) ? 10.sp : 14.sp),
//       ),
//       loader: Container(
//         padding: EdgeInsets.all(10),
//         child: SpinKitRotatingCircle(
//           color: Colors.white,
//           // size: loaderWidth ,
//         ),
//       ),
//       onTap: onTap,
//     );
//   }
// }

// class Button1 extends StatelessWidget {
//   const Button1({
//     Key? key,
//     this.color,
//     this.bottonText,
//     this.onTap,
//     this.borderSide,
//     this.textcolor,
//   }) : super(key: key);
//   final color;
//   final String? bottonText;
//   final onTap;
//   final borderSide;
//   final textcolor;

//   @override
//   Widget build(BuildContext context) {
//     return ArgonButton(
//       height: isTab(context) ? 70 : 50,
//       width: 100.w,
//       color: color,
//       borderRadius: 8,
//       borderSide: borderSide,
//       child: Text(
//         bottonText!,
//         style: TextStyle(
//             color: textcolor,
//             fontWeight: FontWeight.w600,
//             fontSize: isTab(context) ? 10.sp : 14.sp),
//       ),
//       loader: Container(
//         padding: EdgeInsets.all(10),
//         child: SpinKitRotatingCircle(color: tPrimaryColor
//             // size: loaderWidth ,
//             ),
//       ),
//       onTap: onTap,
//     );
//   }
// }

// class DownloadButton extends StatelessWidget {
//   const DownloadButton({
//     Key? key,
//     this.color,
//     this.bottonText,
//     this.onTap,
//     this.borderSide,
//     this.textcolor,
//     this.image,
//   }) : super(key: key);
//   final color;
//   final String? bottonText;
//   final onTap;
//   final borderSide;
//   final textcolor;
//   final image;

//   @override
//   Widget build(BuildContext context) {
//     return ArgonButton(
//       height: isTab(context) ? 70 : 50,
//       width: 100.w,
//       color: color,
//       borderRadius: 8,
//       borderSide: borderSide,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Icon(
//             Icons.download_for_offline_rounded,
//             color: tTextBlue,
//           ),
//           SizedBox(
//             width: 1.w,
//           ),
//           Text(
//             bottonText!,
//             style: TextStyle(
//                 color: textcolor,
//                 fontWeight: FontWeight.w600,
//                 fontSize: isTab(context) ? 10.sp : 10.sp),
//           ),
//         ],
//       ),
//       loader: Container(
//         padding: EdgeInsets.all(10),
//         child: SpinKitRotatingCircle(color: tTextBlue),
//       ),
//       onTap: onTap,
//     );
//   }
// }
