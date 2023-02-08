import 'package:block_box/view/pages/cartpage.dart';
import 'package:block_box/view/pages/historypage.dart';
import 'package:block_box/view/pages/homepage.dart';
import 'package:block_box/view/pages/profilepage.dart';
import 'package:flutter/material.dart';

class NaviBar extends StatefulWidget {
  const NaviBar({super.key});

  @override
  State<NaviBar> createState() => _NaviBarState();
}

class _NaviBarState extends State<NaviBar> {
  int index = 0;
  static List<Widget> pages = [
    const HomePage(),
    const CartPage(),
    //const HistoryPage(),
    const ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    //  double myHeight = MediaQuery.of(context).size.height;
    //  double myWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: pages.elementAt(index),
        bottomNavigationBar: BottomNavigationBar(
            showSelectedLabels: false,
            showUnselectedLabels: false,
            type: BottomNavigationBarType.fixed,
            onTap: (value) {
              setState(() {
                index = value;
              });
            },
            //iconSize: 20,
            elevation: 0,
            currentIndex: index,
            items: [
              BottomNavigationBarItem(
                  label: "",
                  activeIcon: const Icon(
                    Icons.home_rounded,
                    color: Colors.purple,
                  ),
                  icon: Icon(
                    Icons.home_rounded,
                    color: Colors.grey.shade300,
                  )),
              BottomNavigationBarItem(
                  label: "",
                  activeIcon: const Icon(Icons.account_balance_wallet_rounded,
                      color: Colors.purple),
                  icon: Icon(Icons.account_balance_wallet_rounded,
                      color: Colors.grey.shade300)),
              BottomNavigationBarItem(
                  activeIcon: const Icon(Icons.calendar_month_outlined,
                      color: Colors.purple),
                  label: "",
                  icon: Icon(Icons.calendar_month_outlined,
                      color: Colors.grey.shade300)),
              BottomNavigationBarItem(
                  activeIcon: const Icon(Icons.person, color: Colors.purple),
                  label: "",
                  icon: Icon(Icons.person, color: Colors.grey.shade300))
            ]),
      ),
    );
  }
}
