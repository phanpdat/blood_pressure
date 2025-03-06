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
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: SizedBox(
        width: 130,
        child: Stack(
          children: [
            ElevatedButton(
              onPressed: widget.onTextButtonPressed,
              style: ElevatedButton.styleFrom(
                foregroundColor: widget.foregroundColor,
                backgroundColor: widget.backgroundColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  side: BorderSide(
                    color: widget.borderSideColor,
                    width: 10,
                  ),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      widget.title,
                      style: TextStyle(
                        color: Colors.white,
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
    );
  }
}
