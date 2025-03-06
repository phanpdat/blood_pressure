import 'package:blood_pressure/conponent/my_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void showDatePickerModal(
    BuildContext context, TextEditingController dateController) {
  DateTime selectedDate = DateTime.now();

  showModalBottomSheet(
    context: context,
    builder: (BuildContext builder) {
      return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        height: 300,
        child: Column(
          children: [
            Expanded(
              child: CupertinoDatePicker(
                mode: CupertinoDatePickerMode.date,
                initialDateTime: selectedDate,
                minimumDate: DateTime(1900),
                maximumDate: DateTime(2100),
                onDateTimeChanged: (DateTime newDate) {
                  selectedDate = newDate;
                },
              ),
            ),
            ButtonWidget(
              title: "Done",
              onTextButtonPressed: () {
                Navigator.pop(context);
                dateController.text =
                    "${selectedDate.day}/${selectedDate.month}/${selectedDate.year}";
              },
            )
          ],
        ),
      );
    },
  );
}
