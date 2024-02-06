// ------------------ Navigation ------------------------ //
import 'package:druk_job/common/widgets/icons.dart';
import 'package:druk_job/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class NavigationMenu extends StatefulWidget {
  const NavigationMenu({super.key});

  static const routeName = '/navigation-menu';

  @override
  State<NavigationMenu> createState() => _NavigationMenuState();
}

class _NavigationMenuState extends State<NavigationMenu> {
  @override
  Widget build(BuildContext context) {
    int currentPageIndex = 0;
    List<Widget> pages = [
      Container(
        color: DJColors.accent,
      ),
      Container(
        color: DJColors.grey,
      ),
      Container(
        color: DJColors.buttonDisabled,
      ),
      Container(
        color: DJColors.borderPrimary,
      ),
    ];

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentPageIndex,
        selectedItemColor: const Color(0xfffe416c),
        selectedLabelStyle: const TextStyle(fontSize: 13),
        onTap: (index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: DJIconImage(
              image: "home.png",
              index: 0,
              currentIndex: currentPageIndex,
              isSelected: 0 == currentPageIndex,
            ),
            label: "Explore",
          ),
          BottomNavigationBarItem(
            icon: DJIconImage(
              image: "categories.png",
              index: 1,
              currentIndex: currentPageIndex,
              isSelected: 1 == currentPageIndex,
            ),
            label: "Auction",
          ),
          BottomNavigationBarItem(
            icon: DJIconImage(
              image: "chat.png",
              index: 2,
              currentIndex: currentPageIndex,
              isSelected: 2 == currentPageIndex,
            ),
            label: "Chat",
          ),
          BottomNavigationBarItem(
            icon: DJIconImage(
              image: "profile.png",
              index: 3,
              currentIndex: currentPageIndex,
              isSelected: 3 == currentPageIndex,
            ),
            label: "Profile",
          ),
        ],
      ),
      body: pages[currentPageIndex],
    );
  }
}
