import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meal_ai/config/theme/brut_theme.dart';
import 'package:meal_ai/core/styles/sizes.dart';

class BrutBottomNavigationBar extends StatefulWidget {
  final List<NavItem> items;
  final int currentIndex;
  final Color defaultColor;
  final Color activeColor;
  final ValueChanged<int> onItemTapped;

  const BrutBottomNavigationBar({
    Key? key,
    required this.items,
    required this.currentIndex,
    this.defaultColor = accentTeal1,
    this.activeColor = black3,
    required this.onItemTapped,
  }) : super(key: key);

  @override
  State<BrutBottomNavigationBar> createState() => _BrutBottomNavigationBarState();
}

class _BrutBottomNavigationBarState extends State<BrutBottomNavigationBar> {
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    setState(() {
      _selectedIndex = widget.currentIndex;
    });

  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    widget.onItemTapped(index);
  }

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: white,
      padding: EdgeInsets.zero,
      shape: const CircularNotchedRectangle(),
      height: 56,
      child: Container(
        decoration: BoxDecoration(
          color: widget.defaultColor,
          boxShadow: const [shadowMediumBrut],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(widget.items.length, (index) {
            var item = widget.items[index];
            return GestureDetector(
              onTap: () => _onItemTapped(index),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                decoration: BoxDecoration(
                  border: _selectedIndex == index ? brutBorderNormal : Border.all(color: Colors.transparent), // Change the border if selected
                  color: _selectedIndex == index ? widget.activeColor : widget.defaultColor, // Change the background color if selected
                  borderRadius: BorderRadius.circular(BorderRadiusSizes.md),
                  boxShadow: _selectedIndex == index ? [shadowMediumBrut] : [], // Change the shadow if selected
                ),
                padding: EdgeInsets.symmetric(vertical: 4, horizontal: 4),
                child: Icon(
                  item.icon,
                  color: _selectedIndex == index ? black1 : black1,
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}

class NavItem {
  final String label;
  final IconData? icon;
  final Function? navigation;

  NavItem({
    required this.label,
    this.icon,
    this.navigation,
  });
}
