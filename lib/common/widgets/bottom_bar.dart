import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/features/account/screens/account_screens.dart';
import 'package:amazon_clone/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:provider/provider.dart';

import '../../features/home/home_screen.dart';

class BottomBar extends StatefulWidget {
  static const String routeName = '/actual-home';

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _page = 0;
  double bottomBarWidth = 42;
  double bottomBarBorderWidth = 5;
  int _cartBadgeAmount = 3;

  List<Widget> pages = [
    const HomeScreen(),
    AccountScreen(),
    const Center(
      child: Text('Cart Page'),
    ),
  ];

  void updatePage(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    final userCartLen = context.watch<UserProvider>().user.cart.length;
    return Scaffold(
      body: pages[_page],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _page,
        selectedItemColor: GlobalVariables.selectedNavBarColor,
        unselectedItemColor: GlobalVariables.unselectedNavBarColor,
        backgroundColor: GlobalVariables.backgroundColor,
        iconSize: 28,
        onTap: updatePage,
        items: [
          BottomNavigationBarItem(
            icon: Container(
              width: bottomBarWidth,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: _page == 0
                        ? GlobalVariables.selectedNavBarColor
                        : GlobalVariables.backgroundColor,
                    width: bottomBarBorderWidth,
                  ),
                ),
              ),
              child: const Icon(Icons.home_outlined),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Container(
              width: bottomBarWidth,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: _page == 1
                        ? GlobalVariables.selectedNavBarColor
                        : GlobalVariables.backgroundColor,
                    width: bottomBarBorderWidth,
                  ),
                ),
              ),
              child: const Icon(Icons.person_outlined),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: badges.Badge(
              // position: badges.BadgePosition.topEnd(top: 0, end: 3),
              badgeAnimation: const badges.BadgeAnimation.slide(),
              showBadge:
                  _page == 2, // Show badge only on the shopping cart icon
              badgeStyle: const badges.BadgeStyle(
                badgeColor: Colors.white,
              ),
              badgeContent: Text(
                userCartLen.toString(),
                // style: TextStyle(color: Colors.white),
              ),
              // onTap: () {
              //   setState(() {
              //     _page = 2;
              //   });
              // },
              child: Container(
                width: bottomBarWidth,
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      color: _page == 2
                          ? GlobalVariables.selectedNavBarColor
                          : GlobalVariables.backgroundColor,
                      width: bottomBarBorderWidth,
                    ),
                  ),
                ),
                child: const Icon(
                  Icons.shopping_cart_outlined,
                  size: 28,
                  color: Colors.black87,
                ),
              ),
            ),
            label: '',
          ),
        ],
      ),
    );
  }
}
