// ------------------ Navigation ------------------------ //
import 'package:druk_job/common/widgets/icons.dart';
import 'package:druk_job/features/job/job.screen.dart';
import 'package:druk_job/features/organization/organization.screen.dart';
import 'package:druk_job/features/personalization/profile/profile.screen.dart';
import 'package:druk_job/features/resume/resume.screen.dart';
import 'package:druk_job/utils/constants/colors.dart';
import 'package:druk_job/utils/constants/image.dart';
import 'package:flutter/material.dart';

class NavigationMenu extends StatefulWidget {
  const NavigationMenu({super.key});

  static const routeName = '/navigation-menu';

  @override
  State<NavigationMenu> createState() => _NavigationMenuState();
}

class _NavigationMenuState extends State<NavigationMenu> {
  int currentPageIndex = 0;
  List<Widget> pages = [
    const JobScreen(),
    const ResumeScreen(),
    const OrganizationScreen(),
    const ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DJColors.white,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentPageIndex,
        selectedItemColor: DJColors.primary,
        selectedLabelStyle: const TextStyle(fontSize: 13),
        onTap: (index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: DJIconImage(
              image: DJImageString.jobsIcon,
              index: 0,
              isSelected: 0 == currentPageIndex,
            ),
            label: "Jobs",
          ),
          BottomNavigationBarItem(
            icon: DJIconImage(
              image: DJImageString.resumeIcon,
              index: 1,
              isSelected: 1 == currentPageIndex,
            ),
            label: "Resumes",
          ),
          BottomNavigationBarItem(
            icon: DJIconImage(
              image: DJImageString.orgsIcon,
              index: 2,
              isSelected: 2 == currentPageIndex,
            ),
            label: "Orgs",
          ),
          BottomNavigationBarItem(
            icon: DJIconImage(
              image: DJImageString.profileIcon,
              index: 3,
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
