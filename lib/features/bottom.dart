import 'package:flutter/material.dart';
import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'bottomsheet/bankdetails.dart';
import 'bottomsheet/showmodel_bottomsheet.dart';
import 'navigationbar/news.dart';
import 'navigationbar/ratealert.dart';
import 'navigationbar/spotrate.dart';

class BottomPage extends StatefulWidget {
  const BottomPage({super.key});

  @override
  State<BottomPage> createState() => _BottomPageState();
}

class _BottomPageState extends State<BottomPage> {
  int currentIndex = 0;

  List<Widget> pages = [
    RateAlert(),
    SpotRate(),
    News(),
    BankDetails(),
  ];

  void _onNavigationBarTap(int index) {
    if (index == 3) {
      showModalBottomSheet(
        context: context,
        builder: (context) {
          return Bottomsheet();
        },
      );
    } else {
      setState(() {
        currentIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: FlashyTabBar(
        backgroundColor:  Color(0xFF061534),
        showElevation: true,
        onItemSelected: _onNavigationBarTap, // Use the correct method
        selectedIndex: currentIndex,
        animationDuration: const Duration(milliseconds: 300),
        animationCurve: Curves.bounceIn,
        items: [
          FlashyTabBarItem(
            icon: Icon(Icons.bar_chart),
            title: Text('Spot Rate',style: TextStyle(color:Color(0xFFBFA13A))),
          ),
          FlashyTabBarItem(
            icon: Icon(Icons.notifications),
            title: Text('Rate Alert',style: TextStyle(color:Color(0xFFBFA13A))),
          ),
          FlashyTabBarItem(
            icon: Icon(Icons.newspaper),
            title: Text('News',style: TextStyle(color:Color(0xFFBFA13A))),
          ),
          FlashyTabBarItem(
            icon: Icon(Icons.more_horiz),
            title: Text('More',style: TextStyle(color:Color(0xFFBFA13A))),
          ),
        ],
      ),
    );
  }
}
