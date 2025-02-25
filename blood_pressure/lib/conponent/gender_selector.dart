import 'package:flutter/material.dart';

class GenderSelector extends StatelessWidget {
  final String gender;
  final String selectedGender;
  final Function(String) onGenderSelected;

  const GenderSelector({
    super.key,
    required this.gender,
    required this.selectedGender,
    required this.onGenderSelected,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onGenderSelected(gender),
      child: Container(
        width: 100,
        height: 60,
        decoration: BoxDecoration(
          color: Color(0xffF2F1F7),
          borderRadius: BorderRadius.circular(10),
        ),
        padding: EdgeInsets.symmetric(horizontal: 2),
        child: Row(
          children: [
            Radio<String>(
              value: gender,
              groupValue: selectedGender,
              activeColor: Colors.blue, // Màu radio khi được chọn
              onChanged: (value) => onGenderSelected(value!),
            ),
            Text(gender
                // style: TextStyle(
                //   color: isSelected
                //       ? Colors.white
                //       : Colors.black, // Thay đổi màu chữ
                //   fontWeight: FontWeight.bold,
                ),
          ],
        ),
      ),
    );
  }
}
