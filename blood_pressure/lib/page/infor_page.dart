import 'package:blood_pressure/conponent/date_picker.dart';
import 'package:blood_pressure/conponent/gender_selector.dart';
import 'package:blood_pressure/conponent/height_picker.dart';
import 'package:blood_pressure/conponent/my_button.dart';
import 'package:blood_pressure/conponent/my_textfield.dart';
import 'package:blood_pressure/conponent/weight_picker.dart';
import 'package:blood_pressure/page/home_page.dart';
import 'package:flutter/material.dart';

void showInforModal(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) => Material(
      // Bọc trong Material để tránh lỗi
      type: MaterialType.transparency,
      child: InforPage(),
    ),
  );
}

class InforPage extends StatefulWidget {
  const InforPage({super.key});

  @override
  State<InforPage> createState() => _InforPageModalState();
}

class _InforPageModalState extends State<InforPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();

  String _gender = "Male"; // Giá trị mặc định

  void reSetTextField() {
    nameController.clear();
    dateController.clear();
    heightController.clear();
    weightController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Bọc trong Scaffold để có hiệu ứng Material đầy đủ
      backgroundColor: Colors.transparent,
      body: Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: DraggableScrollableSheet(
          initialChildSize: 1, // Mặc định chiếm toàn bộ màn hình
          minChildSize: 0.5, // Giới hạn kéo xuống 50%
          maxChildSize: 1,
          expand: true,
          builder: (context, scrollController) {
            return Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              ),
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
              child: SingleChildScrollView(
                controller: scrollController,
                physics: BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Icon Close
                    Center(
                      child: Container(
                        width: 40,
                        height: 5,
                        decoration: BoxDecoration(
                          color: Colors.grey[400],
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),

                    // Title
                    Center(
                      child: Text(
                        "Add Profile Details",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    SizedBox(height: 30),

                    // Full Name
                    Text("Full Name"),
                    SizedBox(height: 10),
                    MyTextfield(
                      hintText: "Full Name",
                      controller: nameController,
                      readOnly: false,
                    ),

                    SizedBox(height: 20),

                    // Date of Birth
                    Text("Date of Birth"),
                    SizedBox(height: 10),
                    MyTextfield(
                      hintText: "Select your date of birth",
                      controller: dateController,
                      icon: Icons.date_range_outlined,
                      onTap: () => showDatePickerModal(context, dateController),
                      readOnly: true,
                    ),

                    SizedBox(height: 20),

                    // Gender
                    Text("Gender (Optional)"),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GenderSelector(
                          gender: "Male",
                          selectedGender: _gender,
                          onGenderSelected: (value) => setState(() {
                            _gender = value;
                          }),
                        ),
                        GenderSelector(
                          gender: "Female",
                          selectedGender: _gender,
                          onGenderSelected: (value) => setState(() {
                            _gender = value;
                          }),
                        ),
                        GenderSelector(
                          gender: "Other",
                          selectedGender: _gender,
                          onGenderSelected: (value) => setState(() {
                            _gender = value;
                          }),
                        ),
                      ],
                    ),

                    SizedBox(height: 20),

                    // Weight
                    Text("Weight"),
                    SizedBox(height: 10),
                    MyTextfield(
                      hintText: "Select your weight",
                      controller: weightController,
                      icon: Icons.monitor_weight_outlined,
                      onTap: () => showWeightPickerModal(context,
                          (weight1, weight2, unit) {
                        setState(() {
                          weightController.text = "$weight1.$weight2 $unit";
                        });
                      }),
                      readOnly: true,
                    ),

                    SizedBox(height: 20),

                    // Height
                    Text("Height"),
                    SizedBox(height: 10),
                    MyTextfield(
                      hintText: "Select your height",
                      controller: heightController,
                      icon: Icons.height,
                      onTap: () =>
                          showHeightPickerModal(context, (feet, inches, unit) {
                        setState(() {
                          heightController.text = "$feet.$inches $unit";
                        });
                      }),
                      readOnly: true,
                    ),

                    SizedBox(height: 40),

                    // Save Button
                    Center(
                      child: ButtonWidget(
                        title: "Save",
                        onTextButtonPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomePage(),
                            ),
                          );
                        },
                      ),
                    ),

                    SizedBox(height: 20),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
