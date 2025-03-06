import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// import '../../../generated/colors.gen.dart';
// import '../constants/ui_constants.dart';

class ButtonWidget extends StatefulWidget {
  const ButtonWidget({
    super.key,
    required this.title,
    required this.onTextButtonPressed,
    this.foregroundColor = Colors.white,
    this.backgroundColor = Colors.purple,
    this.borderSideColor = Colors.transparent,
  });

  final Color foregroundColor;
  final Color backgroundColor;
  final Color borderSideColor;
  final String title;
  final VoidCallback? onTextButtonPressed;

  @override
  State<ButtonWidget> createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<ButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Center(
        // Đưa nút vào giữa màn hình
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30),
          child: SizedBox(
            width: 150,
            child: Stack(
              children: [
                ElevatedButton(
                  onPressed: widget.onTextButtonPressed,
                  style: ElevatedButton.styleFrom(
                    foregroundColor: widget.foregroundColor,
                    backgroundColor: widget.backgroundColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(
                        color: widget.borderSideColor,
                        width: 2, // Giảm độ dày viền để đẹp hơn
                      ),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          widget.title,
                          style: TextStyle(
                            color: widget.foregroundColor,
                            fontSize: 12,
                          ),
                          overflow: TextOverflow.clip,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
