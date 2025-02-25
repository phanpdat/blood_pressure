import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void showDatePickerModal(
    BuildContext context, TextEditingController dateController) {
  DateTime selectedDate = DateTime.now();

  showModalBottomSheet(
    context: context,
    builder: (BuildContext builder) {
      return Container(
        height: 250,
        color: Colors.white,
        child: Column(
          children: [
            // Nút "Done"
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  dateController.text =
                      "${selectedDate.day}/${selectedDate.month}/${selectedDate.year}";
                },
                child: Text("Done",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
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
          ],
        ),
      );
    },
  );
}
