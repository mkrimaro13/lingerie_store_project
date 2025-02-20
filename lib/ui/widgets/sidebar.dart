import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:lingerie_store_project/layout/colors.dart';

class CustomSideBar extends StatefulWidget {
  const CustomSideBar({super.key});

  @override
  State<CustomSideBar> createState() => _CustomSideBar();
}

class _CustomSideBar extends State<CustomSideBar> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      log('$index');
      _selectedIndex = index;
      Navigator.pop(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: BrandColors.pastelPurple.value,
              image: DecorationImage(
                image: AssetImage('lib/images/logo.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Text(''),
          ),
          ListTile(
            title: const Text(
              'Home 🏠',
              textAlign: TextAlign.center,
            ),
            onTap: () => _onItemTapped(0),
            selected: _selectedIndex == 0,
          ),
          ListTile(
            title: const Text(
              'Products 👙',
              textAlign: TextAlign.center,
            ),
            onTap: () => _onItemTapped(1),
            selected: _selectedIndex == 1,
          ),
        ],
      ),
    );
  }
}
