import 'package:blood_pressure/conponent/date_picker.dart';
import 'package:blood_pressure/conponent/gender_selector.dart';
import 'package:blood_pressure/conponent/height_picker.dart';
import 'package:blood_pressure/conponent/my_button.dart';
import 'package:blood_pressure/conponent/my_textfield.dart';
import 'package:blood_pressure/conponent/weight_picker.dart';
import 'package:blood_pressure/page/home_page.dart';
import 'package:flutter/material.dart';

class InforPage extends StatefulWidget {
  const InforPage({super.key});

  @override
  State<InforPage> createState() => _InforPageState();
}

class _InforPageState extends State<InforPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();

  String _gender = "Male"; // Giá trị mặc định

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          backgroundColor: Color(0xFFFFFFFF),
          appBar: AppBar(
              title: Center(
                child: Text(
                  "Add Profile Details",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              backgroundColor: Colors.transparent,
              automaticallyImplyLeading: false),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 30),

                  // Full Name
                  Text("Full Name"),
                  SizedBox(height: 15),
                  MyTextfield(
                    hinText: "Full Name",
                    controller: nameController,
                    icons: Icons.person_outline,
                    onTap: () {},
                    readOnly: false,
                  ),

                  SizedBox(height: 25),

                  // Date of Birth
                  Text("Date of Birth"),
                  SizedBox(height: 15),
                  MyTextfield(
                    hinText: "Select your date of birth",
                    controller: dateController,
                    icons: Icons.date_range_outlined,
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
                        gender: "Orther",
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
                    hinText: "Select your weight",
                    controller: weightController,
                    icons: Icons.monitor_weight_outlined,
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
                    hinText: "Select your height",
                    controller: heightController,
                    icons: Icons.height,
                    onTap: () =>
                        showHeightPickerModal(context, (feet, inches, unit) {
                      setState(() {
                        heightController.text = "$feet.$inches $unit";
                      });
                    }),
                    readOnly: true,
                  ),

                  SizedBox(
                    height: 80,
                  ),
                  MyButton(
                    text: "Save",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomePage(),
                        ),
                      );
                    },
                  ),
                  SizedBox(
                    height: 50,
                  )
                ],
              ),
            ),
          ),
        ),
        SafeArea(
          child: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black, size: 30),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomePage(),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
