import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyTextfield extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final IconData? icon;
  final VoidCallback? onTap;
  final bool readOnly;

  const MyTextfield({
    super.key,
    required this.hintText,
    required this.controller,
    this.icon,
    this.onTap,
    this.readOnly = false, // Mặc định có thể nhập
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: onTap != null
          ? AbsorbPointer(
              // Nếu có onTap, chặn nhập
              child: TextField(
                readOnly: true, // Chỉ đọc khi có onTap
                controller: controller,
                decoration: InputDecoration(
                  hintText: hintText,
                  filled: true,
                  fillColor: const Color(0xffF2F1F7),
                  suffixIcon: icon != null ? Icon(icon) : null,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            )
          : TextField(
              // Nếu không có onTap, cho phép nhập
              readOnly: readOnly,
              controller: controller,
              decoration: InputDecoration(
                hintText: hintText,
                filled: true,
                fillColor: const Color(0xffF2F1F7),
                suffixIcon: icon != null ? Icon(icon) : null,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
    );
  }
}
