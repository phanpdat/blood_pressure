import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void showHeightPickerModal(
    BuildContext context, Function(int, int, String) onHeightSelected) {
  int selectedFeet = 5;
  int selectedInches = 0;
  String selectedUnit = "Feet/Inches";

  final List<String> units = ["Feet/Inches", "Inches", "Centimeter"];

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
                "Select your height",
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
                  // Feet Picker
                  Expanded(
                    child: CupertinoPicker(
                      itemExtent: 40,
                      onSelectedItemChanged: (int index) {
                        selectedFeet = index + 3;
                      },
                      children: List.generate(
                          10,
                          (index) => Center(
                                child: Text("${index + 3}",
                                    style: TextStyle(fontSize: 20)),
                              )),
                    ),
                  ),
                  // Inches Picker
                  Expanded(
                    child: CupertinoPicker(
                      itemExtent: 40,
                      onSelectedItemChanged: (int index) {
                        selectedInches = index;
                      },
                      children: List.generate(
                          12,
                          (index) => Center(
                                child: Text("$index",
                                    style: TextStyle(fontSize: 20)),
                              )),
                    ),
                  ),
                  // Unit Picker
                  Expanded(
                    child: CupertinoPicker(
                      itemExtent: 40,
                      onSelectedItemChanged: (int index) {
                        selectedUnit = units[index];
                      },
                      children: units
                          .map(
                            (unit) => Text(unit),
                          )
                          .toList(),
                    ),
                  ),
                ],
              ),
            ),
            // Nút "Done"
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
                  onHeightSelected(selectedFeet, selectedInches, selectedUnit);
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
