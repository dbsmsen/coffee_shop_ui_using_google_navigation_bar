import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class MyBottomNavBar extends StatelessWidget{
  void Function(int)? onTabChange;
  MyBottomNavBar({super.key, required this.onTabChange,});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.brown[400],
      child: GNav(
        onTabChange: (value) => onTabChange!(value),
        color: Colors.grey[200],
        mainAxisAlignment: MainAxisAlignment.center,
        activeColor: Colors.brown[800],
        tabBackgroundColor: Colors.grey.shade200,
        tabBorderRadius: 24,
        tabActiveBorder: Border.all(color: Colors.white),
        tabs: const [
        GButton(
          icon: Icons.home,
          text: 'Home',
        ),
        GButton(
          icon: Icons.shopping_bag_outlined,
          text: 'Cart',
        ),
      ],),
    );
  }


}