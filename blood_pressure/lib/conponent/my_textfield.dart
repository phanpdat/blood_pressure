import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyTextfield extends StatelessWidget {
  String hinText;
  final TextEditingController controller;
  IconData icons;
  void Function()? onTap;
  bool readOnly;
  MyTextfield(
      {super.key,
      required this.hinText,
      required this.controller,
      required this.icons,
      required this.onTap,
      required this.readOnly});

  @override
  Widget build(BuildContext context) {
    return TextField(
      readOnly: readOnly,
      controller: controller,
      decoration: InputDecoration(
        hintText: hinText,
        //hintStyle: TextStyle(color: Colors.white70),
        filled: true,
        fillColor: Color(0xffF2F1F7),
        suffixIcon: GestureDetector(onTap: onTap, child: Icon(icons)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
