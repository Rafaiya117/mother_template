import 'package:flutter/material.dart';
import 'package:mother_template/core/components/custom_navitem.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onItemTapped;

  const CustomBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      color: const Color(0xFF2F2F53), // Dark background
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CustomNavItem(
            icon: Icons.home,
            label: 'Home',
            isSelected: currentIndex == 0,
            onTap: () => onItemTapped(0),
          ),
          CustomNavItem(
            icon: Icons.history,
            label: 'Memories',
            isSelected: currentIndex == 1,
            onTap: () => onItemTapped(1),
          ),
          CustomNavItem(
            icon: Icons.note,
            label: 'Capsules',
            isSelected: currentIndex == 2,
            onTap: () => onItemTapped(2),
          ),
          CustomNavItem(
            icon: Icons.person,
            label: 'Profile',
            isSelected: currentIndex == 3,
            onTap: () => onItemTapped(3),
          ),
        ],
      ),
    );
  }
}
//!--------------------!
// int _selectedIndex = 0;

//   void _onNavItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }
// CustomBottomNavigationBar(
//   currentIndex: _selectedIndex,
//   onItemTapped: _onNavItemTapped,
// ),