import 'package:blood_pressure/conponent/my_button.dart';
import 'package:blood_pressure/page/infor_page.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});
  void showInforModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // Cho phép mở rộng toàn màn hình
      backgroundColor: Colors.transparent,
      builder: (context) => InforPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Center(
          child: Text("Person Page"),
        ),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(child: Container()),
            ],
          ),
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: SafeArea(
              child: Center(
                // 🔥 Đảm bảo nút không bị kéo full width
                child: SizedBox(
                  width: 130, // 🔥 Giới hạn chiều rộng của nút
                  child: ButtonWidget(
                    title: "ADD NEW",
                    onTextButtonPressed: () => showInforModal(context),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
