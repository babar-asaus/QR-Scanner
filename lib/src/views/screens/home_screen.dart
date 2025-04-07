import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qr_scanner/utils/constants.dart';
import 'package:qr_scanner/utils/strings.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (bool didPop, dynamic result){
        if(!didPop){
          if (_currentIndex != 0) {
            // Navigate to index 0
            setState(() {
              _currentIndex = 0;
            });
          } else {
            // Exit app when already at index 0
            SystemNavigator.pop();
          }
        }
      },
      child: Scaffold(
        body: bottomNavList[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.blueAccent,
          unselectedItemColor: Colors.blueGrey,
          backgroundColor: Colors.white,
          currentIndex: _currentIndex,
          onTap: (index) => setState(() => _currentIndex = index),
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.qr_code_scanner), label: navScan),
            BottomNavigationBarItem(icon: Icon(Icons.menu_open), label: navCreate),
            BottomNavigationBarItem(icon: Icon(Icons.history), label: navHistory),
            BottomNavigationBarItem(icon: Icon(Icons.settings), label: navSettings),
          ],
        ),
      ),
    );
  }
}
