import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BottomNavBar extends StatelessWidget {
  int selectedIndex;
  void Function(int)? onTap;
  BottomNavBar({super.key, required this.selectedIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed, // Hiển thị tất cả icon cùng lúc
      backgroundColor: Colors.white,
      elevation: 0, // Loại bỏ bóng mặc định
      selectedItemColor: Colors.black, // Màu icon khi được chọn
      unselectedItemColor: Colors.grey[300], // Màu icon chưa chọn
      currentIndex: selectedIndex, // Mục đang được chọn
      onTap: onTap, // Xử lý chọn mục
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.menu), label: ""),
        BottomNavigationBarItem(icon: Icon(Icons.show_chart), label: ""),
        BottomNavigationBarItem(
            icon: Container(
              margin: EdgeInsets.only(top: 8),
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                color: Colors.purple,
              ),
              child: Icon(Icons.add, size: 30),
            ),
            label: ""), // Nút giữa lớn hơn
        BottomNavigationBarItem(icon: Icon(Icons.person), label: ""),
        BottomNavigationBarItem(icon: Icon(Icons.settings), label: ""),
      ],
    );
  }
}
