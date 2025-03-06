import 'package:blood_pressure/conponent/my_button.dart';
import 'package:blood_pressure/page/home_page.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true, // 🔥 Tránh lỗi che nút khi mở bàn phím
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(
          child: Text("Person Page"),
        ),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(child: Container()), // 🔥 Giúp giữ layout ổn định
            ],
          ),
          Positioned(
            bottom: 20, // 🔥 Đưa nút xuống sát đáy, tránh bị ẩn
            left: 20,
            right: 20,
            child: SafeArea(
              child: ButtonWidget(
                title: "Add New",
                onTextButtonPressed: () {
                  showInforModal(context);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
