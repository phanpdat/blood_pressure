import 'package:blood_pressure/conponent/bottom_nav_bar.dart';
import 'package:blood_pressure/page/analytics_page.dart';
import 'package:blood_pressure/page/infor_page.dart';
import 'package:blood_pressure/page/menu_page.dart';
import 'package:blood_pressure/page/profile_page.dart';
import 'package:blood_pressure/page/setting_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0; // Lưu trạng thái mục được chọn

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
      if (index == 2) {
        Navigator.pop(context);
      } // Cập nhật trạng thái khi chọn mục
    });
  }

  final List page = [
    MenuPage(),
    AnalyticsPage(),
    InforPage(),
    ProfilePage(),
    SettingPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: page[selectedIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.2), // Bóng đổ
              blurRadius: 10,
              spreadRadius: 2,
              offset: Offset(0, -3), // Dịch bóng lên trên
            )
          ],
        ),
        child: BottomNavBar(
          selectedIndex: selectedIndex,
          onTap: onItemTapped,
        ),
      ),
    );
  }
}
