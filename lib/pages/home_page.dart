import 'package:coffee_shop/components/bottom_nav_bar.dart';
import 'package:coffee_shop/pages/shop_page.dart';
import 'package:flutter/material.dart';
import 'package:coffee_shop/const.dart';

import 'cart_page.dart';

class HomePage extends StatefulWidget{
  const HomePage ({super.key});

  @override
  State <HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{

  int _selectedIndex = 0;
  void navigationBottomBar(int index){
    setState(() {
      _selectedIndex = index;
    });
  }

  final List <Widget> _pages = [
    ShopPage(),
    CartPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      bottomNavigationBar: MyBottomNavBar(
        onTabChange: (index) => navigationBottomBar(index),
      ),
      body: _pages[_selectedIndex],
    );
  }
}
