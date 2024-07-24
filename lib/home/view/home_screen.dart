import 'package:chartvault/const/borderradius.dart';
import 'package:chartvault/const/borders.dart';
import 'package:chartvault/const/colors.dart';
import 'package:chartvault/const/filters.dart';
import 'package:chartvault/const/gradbackground.dart';
import 'package:chartvault/const/padding.dart';
import 'package:chartvault/const/texttheme.dart';
import 'package:chartvault/home/view/widgets/bottomnavigation.dart';
import 'package:chartvault/news/view/news_screen.dart';
import 'package:chartvault/profile/profile_screen.dart';
import 'package:chartvault/signals/view/signal_screen.dart';
import 'package:chartvault/workshop/view/videos_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PageController pageViewController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: backgroundDecoration,
        child: Scaffold(
          extendBody: true,
          bottomNavigationBar: Padding(
            padding: CustomPadding.padding,
            child: ClipRRect(
              borderRadius: CustomRadius.btmRadius,
              child: BackdropFilter(
                filter: CustomFilters.blurFilter,
                child: Container(
                    decoration: BoxDecoration(
                      color: CustomColors.btmBackground,
                      borderRadius: CustomRadius.btmRadius,
                      border: CustomBorders.greyBorder,
                    ),
                    child: CustomBottomNavigation(
                        pageViewController: pageViewController)),
              ),
            ),
          ),
          body: PageView(
              controller: pageViewController,
              physics: const NeverScrollableScrollPhysics(),
              children: List.generate(
                4,
                (index) {
                  if (index == 0) {
                    return const NewsScreen();
                  }
                  if (index == 1) {
                    return const SignalScreen();
                  }

                  if (index == 2) {
                    return const VideosScreen(id: '');
                  }
                  if (index == 3) {
                    return ProfileScreen();
                  }
                  return Center(
                      child: Text(
                    index.toString(),
                    style: context.headlineLarge,
                  ));
                },
              )),
        ),
      ),
    );
  }
}
