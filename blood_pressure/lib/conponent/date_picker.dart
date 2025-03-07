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
        height: 350,
        color: Colors.white,
        child: Column(
          children: [
            // Nút "Done"
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "Select your date of birth",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54),
              ),
            ),
            // Date Picker
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
            Padding(
              padding: const EdgeInsets.only(bottom: 25, top: 10),
              child: ButtonWidget(
                title: "Done",
                onTextButtonPressed: () {
                  Navigator.pop(context);
                  dateController.text =
                      "${selectedDate.day}/${selectedDate.month}/${selectedDate.year}";
                },
              ),
            ),
          ],
        ),
      );
    },
  );
}
