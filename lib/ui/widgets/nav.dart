import 'package:flutter/material.dart';

class Nav extends StatefulWidget {
  final int? selectedIndex;
  final Function(int)? onItemTap;

  const Nav({
    Key? key,
    this.selectedIndex = 0,
    this.onItemTap,
  }) : super(key: key);
  @override
  _NavState createState() => _NavState();
}

class _NavState extends State<Nav> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.notifications),
          label: "Notification",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: "Profile",
        ),
      ],
      showSelectedLabels: false,
      showUnselectedLabels: false,
      currentIndex: widget.selectedIndex!,
      onTap: widget.onItemTap,
    );
  }
}
