import 'package:flutter/material.dart';

enum MediaType { image, video, text }

class MediaCard extends StatelessWidget {
  final String? imagePath; 
  final String? title;     
  final String? description; 
  final MediaType type;    
  final double height;
  final double width;

  const MediaCard({
    Key? key,
    this.imagePath,
    this.title,
    this.description,
    required this.type,
    this.height = 200,
    this.width = double.infinity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Container(
        width: width,
        height: height,
        color: Colors.white,
        child: type == MediaType.text
            ? _buildTextCard()
            : _buildImageOrVideoCard(),
      ),
    );
  }

  /// Image or Video Card
  Widget _buildImageOrVideoCard() {
    return Stack(
      children: [
        // Background image
        Positioned.fill(
          child: Image.asset(
            imagePath ?? "",
            fit: BoxFit.cover,
          ),
        ),
        // Overlay icon
        Positioned(
          right: 8,
          bottom: 8,
          child: Container(
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: Colors.black54,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Icon(
              type == MediaType.video
                  ? Icons.videocam
                  : Icons.photo, // image → gallery icon
              color: Colors.white,
              size: 20,
            ),
          ),
        ),
      ],
    );
  }

  /// Text Card
  Widget _buildTextCard() {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (title != null)
            Row(
              children: [
                const Icon(Icons.article, size: 18, color: Colors.black54), // text icon
                const SizedBox(width: 6),
                Expanded(
                  child: Text(
                    title!,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          if (description != null) ...[
            const SizedBox(height: 6),
            Text(
              description!,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black87,
              ),
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ],
      ),
    );
  }
}
//usage
// Image card
// MediaCard(
//   type: MediaType.image,
//   imagePath: "assets/images/family.jpg",
//   height: 200,
// ),

// // Video card
// MediaCard(
//   type: MediaType.video,
//   imagePath: "assets/videos/cover.jpg", // thumbnail image
//   height: 200,
// ),

// // Text card
// MediaCard(
//   type: MediaType.text,
//   title: "Exciting Day!",
//   description: "Today was absolutely amazing! I went to the beach...",
//   height: 160,
// ),
