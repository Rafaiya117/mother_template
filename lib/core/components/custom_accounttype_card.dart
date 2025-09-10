import 'package:flutter/material.dart';

class CustomAccountOption extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final Color iconBackgroundColor;
  final String title;
  final String subtitle;
  final Color titleColor;
  final Color subtitleColor;
  final VoidCallback onTap;

  const CustomAccountOption({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
    this.iconColor = Colors.blue,
    this.iconBackgroundColor = const Color(0xFFEAF3FF),
    this.titleColor = const Color(0xFF1E3A4D),
    this.subtitleColor = Colors.black54,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.grey.shade300, width: 1),
        ),
        child: Row(
          children: [
            // Icon with background
            Container(
              height: 42,
              width: 42,
              decoration: BoxDecoration(
                color: iconBackgroundColor,
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: iconColor, size: 22),
            ),
            const SizedBox(width: 14),
            // Title + Subtitle
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: titleColor,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 14,
                    color: subtitleColor,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
//!-----------usages---------------!
// CustomAccountOption(
//   icon: Icons.group,
//   title: "Legacy Account",
//   subtitle: "Live, Preserve, Create.",
//   iconColor: Colors.blue,
//   onTap: () {
//     print("Legacy tapped");
//   },
// ),
//!---------------------------------!