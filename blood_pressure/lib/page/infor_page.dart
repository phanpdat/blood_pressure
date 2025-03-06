import 'package:blood_pressure/conponent/date_picker.dart';
import 'package:blood_pressure/conponent/gender_selector.dart';
import 'package:blood_pressure/conponent/height_picker.dart';
import 'package:blood_pressure/conponent/my_button.dart';
import 'package:blood_pressure/conponent/my_textfield.dart';
import 'package:blood_pressure/conponent/weight_picker.dart';
import 'package:blood_pressure/page/home_page.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class InforPage extends StatefulWidget {
  bool ispresse = true;
  InforPage({super.key, required this.ispresse});

  @override
  State<InforPage> createState() => _InforPageState();
}

class _InforPageState extends State<InforPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();

  String _gender = "Male";
  // Giá trị mặc định

  void reSetTextField() {
    nameController.clear();
    dateController.clear();
    heightController.clear();
    weightController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          // ✅ Bọc trong Scaffold để đảm bảo có Material
          backgroundColor: Colors.transparent,
          body: Container(
            height:
                MediaQuery.of(context).size.height, // Chiếm toàn bộ màn hình
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            child: SingleChildScrollView(
              //keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 40),

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
                    SizedBox(height: 15),
                    MyTextfield(
                      hintText: "Full Name",
                      controller: nameController,
                      readOnly: false,
                    ),

                    SizedBox(height: 25),

                    // Date of Birth
                    Text("Date of Birth"),
                    SizedBox(height: 15),
                    MyTextfield(
                      hintText: "Select your date of birth",
                      controller: dateController,
                      icon: Icons.date_range_outlined,
                      onTap: () => showDatePickerModal(context, dateController),
                      readOnly: true,
                    ),

                    SizedBox(height: 25),

                    // Gender(giới tính)
                    Text("Gender (Optional)"),
                    SizedBox(height: 15),
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

                    SizedBox(height: 25),

                    // Weight
                    Text("Weight"),
                    SizedBox(height: 15),
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
                    SizedBox(height: 25),

                    // Height
                    Text("Height"),
                    SizedBox(height: 15),
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

                    SizedBox(height: 80),

                    // Save Button
                    Center(
                      child: ButtonWidget(
                        title: "Save",
                        onTextButtonPressed: () {
                          reSetTextField();
                          //thực hiên thêm users vào list users
                          if (widget.ispresse) {
                            // 🔥 Lần đầu tiên chuyển về HomePage
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomePage()),
                            );
                            // Đánh dấu lần sau sẽ chuyển sang UserPage
                          } else {
                            Navigator.pop(context);
                          }
                        },
                      ),
                    ),

                    SizedBox(height: 50),
                  ],
                ),
              ),
            ),
          ),
        ),
        SafeArea(
          child: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black, size: 30),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      ],
    );
  }
}
