import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomBottomNavigation extends StatefulWidget {
  final PageController pageViewController;
  const CustomBottomNavigation({super.key, required this.pageViewController});

  @override
  State<CustomBottomNavigation> createState() => _CustomBottomNavigationState();
}

class _CustomBottomNavigationState extends State<CustomBottomNavigation> {
  int btmIndex = 0;

  @override
  void initState() {
    super.initState();
    btmIndex = widget.pageViewController.initialPage;
  }

  @override
  Widget build(BuildContext context) {
    List<BottomNavigationBarItem> items = [
      BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'images/News.svg',
            width: 24,
            height: 24,
            color: btmIndex == 0 ? Colors.white : Colors.grey,
          ),
          label: 'Radio'),
      BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'images/Signals.svg',
            width: 24,
            height: 24,
            color: btmIndex == 1 ? Colors.white : Colors.grey,
          ),
          label: 'Signals'),
      BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'images/Video.svg',
            width: 24,
            height: 24,
            color: btmIndex == 2 ? Colors.white : Colors.grey,
          ),
          label: 'Workshop'),
      BottomNavigationBarItem(
          icon: Padding(
            padding: const EdgeInsets.all(3.0),
            child: SvgPicture.asset(
              'images/Menu.svg',
              height: 16,
              color: btmIndex == 3 ? Colors.white : Colors.grey,
            ),
          ),
          label: 'Menu'),
    ];

    return BottomNavigationBar(
      selectedFontSize: 10,
      unselectedFontSize: 8,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.grey,
      backgroundColor: Colors.transparent,
      currentIndex: btmIndex,
      onTap: (int index) {
        setState(() => btmIndex = index);
        widget.pageViewController.jumpToPage(index);
      },
      type: BottomNavigationBarType.fixed,
      items: items,
    );
  }
}
