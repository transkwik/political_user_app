import 'package:flutter/material.dart';
import 'package:ysrct_political/my_task/my_task.dart';
import 'package:ysrct_political/poster_page_screen/poster_page_screen.dart';
import 'package:ysrct_political/promo_screen/promo_screen.dart';

import 'News_feed_screen/news_feed_screen.dart';
import 'basic_details_screen/basic_details_screen.dart';
import 'constants/constants.dart';
import 'constants/imageConstant.dart';
import 'homepage_screen/homepage_screen.dart';
import 'profile_screen/profile_screen.dart';
import 'topics_screen/topicscreen.dart';
 
class BottomNavigation extends StatefulWidget {
  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _selectedIndex = 0; // Default selected index (Coupons)

  final List<String> _selectedImagePaths = [
    Images.CASHBACKSELECTEDICON,
    Images.POSTERSELECTEDICON,
    Images.PROMOSELECTEDICON,
    Images.TOPICELECTEDICON,
  ];
  final List<String> _unselectedImagePaths = [
    Images.CASHBACKUNSELECTEDICON,
    Images.POSTERUNSELECTEDICON,
    Images.PROMOUNSELECTEDICON,
    Images.TOPICUNSELECTEDICON,
  ];
  final List<String> _labels = [
    "News",
    "Posters",
    "Promo",
    "Topics",
  ];
  final List<Widget> _pages = [
    NewsFeedPage(),
   
   
    PostersPage(),

    PromoScreenPage(),

    TopicsScreen(),
    
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, //
      body: Center(
        child: IndexedStack(
          index: _selectedIndex,
          children: _pages,
        ),
      ),
      bottomNavigationBar: Container(
        // padding: EdgeInsets.symmetric(vertical: 0),
        decoration: BoxDecoration(
          boxShadow: [tBoxShadow],
          color: Colors.white, // Light background like your image
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
              print(_selectedIndex);
            });
          },
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.transparent,

          elevation: 0, // Removes shadow
          selectedLabelStyle: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold), // Selected label style
          unselectedLabelStyle: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.normal), // Unselected label style

          enableFeedback: false,
          selectedItemColor: tPrimaryColor, // Active item color
          unselectedItemColor: Colors.grey[700], // Inactive item color
          showSelectedLabels: true,
          showUnselectedLabels: true,

          items: List.generate(_unselectedImagePaths.length, (index) {
            return BottomNavigationBarItem(
              icon: Image.asset(
                _selectedIndex == index
                    ? _selectedImagePaths[index]
                    : _unselectedImagePaths[index],
                width: 24,
                height: 24,
              ),
              label: _labels[index],
            );
          }),
        ),
      ),
    );
  }
}
