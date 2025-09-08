import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class ProgressIndicatorWidget extends StatelessWidget {
  final int currentPage;  
  final int totalPages;   
  final double barHeight; 
  final Color progressColor; 
  final Color backgroundColor; 

  // Constructor to accept the parameters
  const ProgressIndicatorWidget({
    super.key,
    required this.currentPage,
    required this.totalPages,
    this.barHeight = 20.0,
    this.progressColor = Colors.orange,
    this.backgroundColor = Colors.grey,
  });

  @override
  Widget build(BuildContext context) {
    double progress = currentPage / totalPages; 

    return LinearPercentIndicator(
      lineHeight: barHeight, 
      percent: progress, 
      backgroundColor: backgroundColor, 
      progressColor: progressColor, 
      barRadius: Radius.circular(8),
      padding: EdgeInsets.all(0), 
    );
  }
}
//!---------usages----------!
// int _currentPage = 1; // Starting from the first page
//   int _totalPages = 5; // Total number of pages

// Function to update progress
// void _nextPage() {
//   setState(() {
//     if (_currentPage < _totalPages) {
//       _currentPage++;
//     }
//   });
// }

// ProgressIndicatorWidget(
//   currentPage: _currentPage,
//   totalPages: _totalPages,
//   barHeight: 20.0,
//   progressColor: Colors.orange,
//   backgroundColor: Colors.grey[300]!,
// ),
// SizedBox(height: 30),
// Text(
//   'Page $_currentPage of $_totalPages',
//   style: TextStyle(fontSize: 18),
// ),
//!---------------------------------!
