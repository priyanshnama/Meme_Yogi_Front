import 'package:flutter/material.dart';
import 'package:memeyogi/ui/widgets/nav.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  List<Widget> _widgetOptions = <Widget>[
    Text("Home"),
    Text("Notifications"),
    Text("Profile"),
  ];

  _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _widgetOptions.elementAt(_selectedIndex),
      ),
      body: Center(),
      bottomNavigationBar: Nav(
        onItemTap: _onItemTap(_selectedIndex),
        selectedIndex: _selectedIndex,
      ),
    );
  }
}
