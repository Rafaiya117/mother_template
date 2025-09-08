import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final double height;
  final double width;
  final double paddingTop;
  final double paddingRight;
  final double paddingBottom;
  final double paddingLeft;
  final double gap;
  final double borderRadius;

  CustomTextField({
    required this.label,
    required this.controller,
    this.height = 48.0,
    this.width = 318.0,
    this.paddingTop = 14.0,
    this.paddingRight = 16.0,
    this.paddingBottom = 14.0,
    this.paddingLeft = 16.0,
    this.gap = 10.0,
    this.borderRadius = 12.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Label above the text field
          Padding(
            padding: EdgeInsets.only(bottom: gap),
            child: Text(
              label,
              style: TextStyle(
                fontSize: 16,
                // ignore: deprecated_member_use
                color: Colors.black.withOpacity(0.6),
              ),
            ),
          ),
          Container(
            height: height,
            width: width,
            padding: EdgeInsets.fromLTRB(paddingLeft, paddingTop, paddingRight, paddingBottom),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey, width: 1),
              borderRadius: BorderRadius.circular(borderRadius),
            ),
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.zero, 
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

//!--------------usage----------!
// Padding(
//   padding: const EdgeInsets.all(16.0),
//   child: CustomTextField(
//     label: "Name",
//     controller: TextEditingController(),
//   ),
// ),
//!------------------------------!