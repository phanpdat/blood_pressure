import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void showWeightPickerModal(
    BuildContext context, Function(int, int, String) onWeightSelected) {
  int selectedWeight1 = 70;
  int selectedWeight2 = 0;
  String selectedUnit = "kgs";

  final List<String> units = ["kgs", "lbs"];

  showModalBottomSheet(
    context: context,
    builder: (BuildContext builder) {
      return Container(
        height: 350,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "Select your weight",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54),
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Phần nguyên
                  Expanded(
                    child: CupertinoPicker(
                      itemExtent: 40,
                      onSelectedItemChanged: (int index) {
                        selectedWeight1 = index + 1;
                      },
                      children: List.generate(
                          200,
                          (index) => Center(
                                child: Text("${index + 1}",
                                    style: TextStyle(fontSize: 20)),
                              )),
                    ),
                  ),
                  // Phần thập phân
                  Expanded(
                    child: CupertinoPicker(
                      itemExtent: 40,
                      onSelectedItemChanged: (int index) {
                        selectedWeight2 = index;
                      },
                      children: List.generate(
                          10,
                          (index) => Center(
                                child: Text("0.$index",
                                    style: TextStyle(fontSize: 20)),
                              )),
                    ),
                  ),
                  // Đơn vị
                  Expanded(
                    child: CupertinoPicker(
                      itemExtent: 40,
                      onSelectedItemChanged: (int index) {
                        selectedUnit = units[index];
                      },
                      children: units
                          .map((unit) => Center(
                                child:
                                    Text(unit, style: TextStyle(fontSize: 16)),
                              ))
                          .toList(),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 32),
                ),
                onPressed: () {
                  Navigator.pop(context);
                  onWeightSelected(
                      selectedWeight1, selectedWeight2, selectedUnit);
                },
                child: Text("Done",
                    style: TextStyle(fontSize: 18, color: Colors.white)),
              ),
            ),
          ],
        ),
      );
    },
  );
}
