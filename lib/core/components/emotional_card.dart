import 'package:flutter/material.dart';

class EmotionalCard extends StatelessWidget {
  final String title;
  final List<String> imageUrls; 

  const EmotionalCard({
    Key? key,
    required this.title,
    required this.imageUrls,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 120,
            child: Stack(
              alignment: Alignment.center,
              children: [
                // Left Image
                Positioned(
                  left: 25,
                  child: Transform.rotate(
                    angle: -0.15, // tilt left
                    child: _buildImage(imageUrls[0], 90, 60),
                  ),
                ),
                // Right Image
                Positioned(
                  right: 25,
                  child: Transform.rotate(
                    angle: 0.15, // tilt right
                    child: _buildImage(imageUrls[2], 90, 60),
                  ),
                ),
                // Center Image
                _buildImage(imageUrls[1], 110, 75),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImage(String path, double height, double width) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Image.asset(
        path,
        height: height,
        width: width,
        fit: BoxFit.cover,
      ),
    );
  }
}
//usage
// EmotionalCard(
//   title: "Emotional",
//   imageUrls: [
//     "assets/images/left.jpg",   // left
//     "assets/images/center.jpg", // center
//     "assets/images/right.jpg",  // right
//   ],
// ),
