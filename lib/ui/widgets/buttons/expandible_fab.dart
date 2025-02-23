import 'package:flutter/material.dart';
import 'package:lingerie_store_project/utils/colors.dart';

class ExpandableFab extends StatefulWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;
  const ExpandableFab({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  State<ExpandableFab> createState() => _ExpandableFabState();
}

class _ExpandableFabState extends State<ExpandableFab>
    with SingleTickerProviderStateMixin {
  bool _expanded = false;
  final double _collapsedWidth = 56.0; // Default FAB size.
  final double _expandedWidth = 200.0; // Width when expanded.

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        width: _collapsedWidth,
        height: _expanded ? _expandedWidth : _collapsedWidth,
        decoration: BoxDecoration(
          color: BrandColors.whitePurple.value,
          borderRadius: BorderRadius.circular(_collapsedWidth / 2),
          boxShadow: [
            BoxShadow(
              color: BrandColors.pastelPurple.value,
              blurRadius: 3,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // When expanded, show extra icons in a Row.
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (_expanded)
                  Column(
                    children: [
                      _buildIconButton(Icons.favorite_rounded, 'Favoritos', 2),
                      _buildIconButton(
                          Icons.shopping_bag_rounded, 'Productos', 1),
                      _buildIconButton(Icons.home_rounded, 'Inicio', 1),
                    ],
                  ),
                // Main icon always visible.
                IconButton(
                  icon: Icon(_expanded ? Icons.close : Icons.add),
                  color: Colors.black87,
                  onPressed: () {
                    setState(() {
                      _expanded = !_expanded;
                    });
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  IconButton _buildIconButton(IconData icon, String label, int index) {
    return IconButton(
      onPressed: () => widget.onItemTapped(index),
      icon: Icon(icon),
      tooltip: label,
      color: Colors.black87,
    );
  }
}
